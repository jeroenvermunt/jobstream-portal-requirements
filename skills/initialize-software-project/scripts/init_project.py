#!/usr/bin/env python3
"""Create a non-destructive software project documentation skeleton."""

from __future__ import annotations

import argparse
from pathlib import Path


SKILL_ROOT = Path(__file__).resolve().parent.parent
TEMPLATE_ROOT = SKILL_ROOT / "assets" / "project-template"
DIRECTORIES = (
    "meetings",
    "requirements",
    "sprints",
    "diagrams",
    "source-material",
)
ROOT_TEMPLATES = {
    "README.md": "README.md.template",
    "SKILLS.md": "SKILLS.md.template",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Initialize an additive software project documentation structure."
    )
    parser.add_argument(
        "--target",
        type=Path,
        default=Path.cwd(),
        help="Project directory to initialize (default: current directory).",
    )
    parser.add_argument(
        "--name",
        help="Project name used in README.md (default: target directory name).",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Report planned changes without writing files.",
    )
    return parser.parse_args()


def find_case_variant(target: Path, expected_name: str) -> Path | None:
    if not target.exists():
        return None
    expected_folded = expected_name.casefold()
    for child in target.iterdir():
        if child.name.casefold() == expected_folded and child.name != expected_name:
            return child
    return None


def ensure_directory(path: Path, dry_run: bool) -> str:
    if path.is_dir():
        return f"exists  {path}"
    if path.exists():
        raise RuntimeError(f"Expected a directory but found a file: {path}")
    if not dry_run:
        path.mkdir(parents=True)
        (path / ".gitkeep").touch()
    return f"create  {path}"


def ensure_template(
    destination: Path, template_name: str, project_name: str, dry_run: bool
) -> str:
    if destination.is_file():
        return f"exists  {destination}"
    if destination.exists():
        raise RuntimeError(f"Expected a file but found a directory: {destination}")

    template = TEMPLATE_ROOT / template_name
    content = template.read_text(encoding="utf-8").replace(
        "{{PROJECT_NAME}}", project_name
    )
    if not dry_run:
        destination.write_text(content, encoding="utf-8")
    return f"create  {destination}"


def main() -> int:
    args = parse_args()
    target = args.target.expanduser().resolve()
    project_name = args.name or target.name

    if not args.dry_run:
        target.mkdir(parents=True, exist_ok=True)

    messages: list[str] = []
    for directory_name in DIRECTORIES:
        variant = find_case_variant(target, directory_name)
        if variant is not None:
            messages.append(
                f"warning case variant exists: {variant}; skipped {target / directory_name}"
            )
            continue
        messages.append(ensure_directory(target / directory_name, args.dry_run))

    for destination_name, template_name in ROOT_TEMPLATES.items():
        messages.append(
            ensure_template(
                target / destination_name,
                template_name,
                project_name,
                args.dry_run,
            )
        )

    print("\n".join(messages))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
