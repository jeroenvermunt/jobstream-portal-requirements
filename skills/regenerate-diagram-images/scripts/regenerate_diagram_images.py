#!/usr/bin/env python3

from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
from pathlib import Path


PUML_SUFFIXES = {".puml", ".plantuml", ".iuml", ".pu", ".uml"}
C4_WORKSPACES = (
    ("c4-model", Path("diagrams/c4-model.dsl"), Path("diagrams/generated/c4-model-dot")),
    ("workspace", Path("diagrams/workspace.dsl"), Path("diagrams/generated/workspace-dot")),
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Regenerate local PNG diagram outputs for this project."
    )
    parser.add_argument(
        "--project",
        default=".",
        help="Project root containing the diagrams directory. Defaults to current directory.",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove owned output directories before regenerating images.",
    )
    return parser.parse_args()


def log(message: str) -> None:
    print(message, flush=True)


def run(command: list[str], cwd: Path, env: dict[str, str] | None = None) -> None:
    log("$ " + " ".join(command))
    subprocess.run(command, cwd=cwd, env=env, check=True)


def require_tool(name: str) -> None:
    if shutil.which(name) is None:
        raise RuntimeError(f"Required command not found on PATH: {name}")


def plantuml_env() -> dict[str, str]:
    env = os.environ.copy()
    option = "-Djava.awt.headless=true"
    current = env.get("JAVA_TOOL_OPTIONS", "").strip()
    if option not in current.split():
        env["JAVA_TOOL_OPTIONS"] = f"{current} {option}".strip()
    return env


def discover_puml_sources(project_root: Path) -> list[Path]:
    diagrams_dir = project_root / "diagrams"
    if not diagrams_dir.exists():
        return []

    sources: list[Path] = []
    for path in diagrams_dir.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in PUML_SUFFIXES:
            continue
        relative_parts = path.relative_to(diagrams_dir).parts
        if relative_parts and relative_parts[0] == "generated":
            continue
        sources.append(path)
    return sorted(sources)


def render_puml_sources(project_root: Path, clean: bool) -> list[Path]:
    output_dir = project_root / "diagrams/generated/puml"
    if clean and output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    sources = discover_puml_sources(project_root)
    if not sources:
        log("No editable PlantUML sources found under diagrams/.")
        return []

    env = plantuml_env()
    generated: list[Path] = []
    for source in sources:
        run(
            [
                "plantuml",
                "-tpng",
                "-charset",
                "UTF-8",
                "-failfast2",
                "-output",
                str(output_dir),
                str(source),
            ],
            cwd=project_root,
            env=env,
        )
        generated.append(output_dir / f"{source.stem}.png")

    return generated


def render_c4_workspaces(project_root: Path, clean: bool) -> list[Path]:
    generated: list[Path] = []

    for label, workspace_path, output_path in C4_WORKSPACES:
        source = project_root / workspace_path
        output_dir = project_root / output_path
        if not source.exists():
            log(f"Skipping missing C4 workspace: {workspace_path}")
            continue

        if clean and output_dir.exists():
            shutil.rmtree(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        log(f"Rendering C4 workspace: {label}")
        run(["structurizr", "validate", "-workspace", str(workspace_path)], cwd=project_root)
        run(
            [
                "structurizr",
                "export",
                "-workspace",
                str(workspace_path),
                "-format",
                "dot",
                "-output",
                str(output_path),
            ],
            cwd=project_root,
        )

        dot_files = sorted(output_dir.glob("*.dot"))
        if not dot_files:
            raise RuntimeError(f"Structurizr produced no DOT files for {workspace_path}")

        for dot_file in dot_files:
            png_file = dot_file.with_suffix(".png")
            run(["dot", "-Tpng", str(dot_file), "-o", str(png_file)], cwd=project_root)
            generated.append(png_file)

    return generated


def main() -> int:
    args = parse_args()
    project_root = Path(args.project).expanduser().resolve()

    if not (project_root / "diagrams").is_dir():
        print(f"Project root has no diagrams directory: {project_root}", file=sys.stderr)
        return 1

    try:
        require_tool("plantuml")
        require_tool("structurizr")
        require_tool("dot")

        generated = []
        generated.extend(render_puml_sources(project_root, args.clean))
        generated.extend(render_c4_workspaces(project_root, args.clean))

    except subprocess.CalledProcessError as exc:
        print(f"Command failed with exit code {exc.returncode}.", file=sys.stderr)
        return exc.returncode or 1
    except RuntimeError as exc:
        print(str(exc), file=sys.stderr)
        return 1

    log("")
    log(f"Generated {len(generated)} PNG file(s):")
    for path in sorted(generated):
        log(f" - {path.relative_to(project_root)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
