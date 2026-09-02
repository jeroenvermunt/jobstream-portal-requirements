---
name: initialize-software-project
description: Initialize or standardize a software development project workspace with agent-readable context, a concise skills index, source evidence, meeting notes, requirements, sprint definitions, and architecture diagrams. Use when Codex needs to bootstrap a new project folder, organize a discovery or delivery repository, or bring an existing software project into a consistent documentation structure without overwriting existing work.
---

# Initialize Software Project

Create an additive, evidence-oriented project structure suitable for product discovery and software delivery.

## Workflow

1. Inspect the target folder before changing it. Identify existing files, naming conventions, source evidence, and generated artifacts.
2. Run `scripts/init_project.py` from this skill directory, passing the target folder explicitly:

   ```bash
   python3 scripts/init_project.py --target /path/to/project --name "Project Name"
   ```

3. Read [references/project-conventions.md](references/project-conventions.md) before organizing existing documents or creating project content.
4. Populate `README.md` from evidence in the target folder. Keep unknowns explicit; do not invent goals, stakeholders, decisions, or status.
5. Populate `SKILLS.md` only with relevant skill names and descriptions. Do not copy procedures, examples, paths, or usage instructions into it.
6. Preserve existing files and their history. Do not overwrite, move, or rename user content unless the user explicitly requests migration. Flag case variants such as `Meetings/` versus `meetings/` instead of creating duplicate trees.
7. Create only artifacts supported by current evidence. Keep raw inputs separate from summaries and requirements.
8. Verify the resulting tree, Markdown links, source references, and absence of unresolved template placeholders.

## Operating Rules

- Treat the bootstrap script as additive and idempotent.
- Prefer lowercase directory names and descriptive kebab-case filenames for new artifacts.
- Distinguish confirmed facts, inferences, and open questions where source confidence matters.
- Keep generated diagram images separate from editable DSL or PlantUML sources.
- Use a more specific available skill when follow-up work requires meeting summarization, architecture generation, PlantUML rendering, or Structurizr previewing.
