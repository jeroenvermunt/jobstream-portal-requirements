# Project Structure Conventions

Use these conventions when adding content after the bootstrap script creates the skeleton.

## Structure

| Path | Purpose |
| --- | --- |
| `README.md` | Fast, evidence-based project orientation for people and agents. |
| `SKILLS.md` | Accessible index containing only relevant skill names and descriptions. |
| `source-material/` | Original briefs, exports, transcripts, and other source evidence. |
| `meetings/` | One folder per meeting, containing raw notes or transcript and a concise summary. |
| `requirements/` | Traceable epic and requirement specifications. |
| `sprints/` | Sprint objectives, committed scope, dependencies, risks, and exclusions. |
| `diagrams/` | Editable Structurizr DSL and PlantUML sources; generated images belong in `diagrams/rendered/`. |

Do not move existing source files into this structure without explicit approval. When standardizing an established project, add missing structure and document deviations in `README.md`.

## Root README

Keep the README concise enough to scan quickly. Populate:

- project goal and current phase;
- principal stakeholders and decision owners;
- success criteria and constraints;
- important domain terms;
- current source-of-truth documents;
- a document index with purpose, status, and reliability;
- unresolved decisions that materially affect delivery.

Remove unused placeholder sections. Never turn assumptions into project facts.

## Skills Index

Use a two-column table with `Skill` and `Description`. Include only skills relevant to the repository's actual work. Descriptions should explain capability and typical applicability in plain language, but must not repeat procedures from a skill's `SKILL.md`.

## Meetings

Use `meetings/<descriptive-meeting-slug>/`. Preserve the raw artifact as `transcript.*` or `notes.*` and write `summary.md` with:

- purpose and participants;
- concise summary;
- decisions;
- requirements or constraints learned;
- action items with owner and due date when known;
- risks and open questions;
- source reference.

Do not present inferred decisions as confirmed. Keep the raw source available for disputed interpretation.

## Requirements

Name epic files `EPIC-NNN-descriptive-slug.md`. Use the sections that add value:

- purpose and delivery relevance;
- status and confidence;
- scope;
- user stories;
- functional requirements and business rules;
- acceptance criteria;
- dependencies;
- open questions;
- out of scope;
- source references.

Label consequential claims as `Confirmed`, `Inferred`, or `Open question` when the distinction is useful. Acceptance criteria must be observable. Link every requirement set to its source evidence.

## Sprints

Name sprint files `sprint-NN.md`. Capture:

- objective and theme;
- included requirements or epics;
- committed scope and key outcomes;
- dependencies and assumptions;
- risks and open questions;
- explicit out-of-scope items;
- traceability to requirements and source evidence.

Do not silently convert candidate scope into committed scope.

## Architecture

Prefer these source names where applicable:

- `diagrams/c4-model.dsl` for the Structurizr workspace;
- `diagrams/<domain>-lifecycle.puml` for statecharts;
- `diagrams/<domain>-er.puml` for entity relationships;
- `diagrams/<interaction>-sequence.puml` for explicitly requested sequences.

Keep editable sources authoritative. Generate images into `diagrams/rendered/` and refresh them after source changes when rendered artifacts are tracked.
