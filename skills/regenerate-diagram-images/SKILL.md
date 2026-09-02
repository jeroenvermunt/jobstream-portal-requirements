---
name: regenerate-diagram-images
description: Regenerate this project's local diagram image outputs from editable PlantUML and Structurizr C4 sources. Use when Codex needs to refresh `diagrams/generated` after changes to `.puml`, `.plantuml`, `.iuml`, `.pu`, `.uml`, `diagrams/c4-model.dsl`, or `diagrams/workspace.dsl`.
---

# Regenerate Diagram Images

Refresh generated PNG diagrams from the editable sources in this project.

## Workflow

1. Run the bundled script from the project root:

   ```bash
   python3 skills/regenerate-diagram-images/scripts/regenerate_diagram_images.py --project .
   ```

2. Do not edit diagram sources when the user only asks to regenerate images.
3. Treat every supported UML file under `diagrams/` as editable source, except anything under `diagrams/generated/`.
4. Render PlantUML sources to `diagrams/generated/puml/`.
5. Render `diagrams/c4-model.dsl` and `diagrams/workspace.dsl`, when present, by exporting DOT with Structurizr and converting DOT to PNG with Graphviz.
6. Report the generated PNG paths and any skipped source files.

## Local Rendering Rules

- Require `plantuml`, `structurizr`, and Graphviz `dot` on `PATH`.
- Use headless Java for PlantUML by setting `JAVA_TOOL_OPTIONS=-Djava.awt.headless=true`.
- Do not render Structurizr DSL through exported PlantUML in this project unless the local PlantUML version is upgraded; the installed renderer is too old for Structurizr's generated style syntax.
- Keep generated files under `diagrams/generated/`; keep editable `.dsl` and `.puml` sources unchanged.

## Validation

After running the script, verify that:

```bash
find diagrams/generated -name '*.png' -type f -exec file {} +
```

returns valid PNG image metadata for the generated files.
