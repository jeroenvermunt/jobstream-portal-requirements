# Engineering Handover Baseline

## Baseline

| Field | Value |
| --- | --- |
| Identifier | `HB-2026-08-31` |
| Estimate scope | `REQ-01` through `REQ-18` |
| Excluded scope | `CAN-*`, `LRN-01`, and later horizons unless separately approved |
| Prototype role | Behavioral reference, not production frontend code |
| Requirements source | `customer-recruitment-portal-requirements.md` |
| Architecture source | `diagrams/workspace.dsl`, `diagrams/erd.puml`, and `diagrams/statecharts/` |
| Execution system | Linear |

## Source Hierarchy

1. Approved product and policy decisions govern durable behavior.
2. The requirements document is the canonical product specification.
3. The ERD, statecharts, and C4 model describe the current technical direction and preserve unresolved points as `TODO` or `ASSUMPTION`.
4. The UX specification and wireframe define accepted presentation and interaction behavior.
5. The tagged Svelte prototype demonstrates behavior but does not define production architecture.
6. Linear issues link to this baseline and track delivery; they do not replace it.

## Reconciliation Outcome

Accepted prototype changes through `CP-21` were reviewed against the durable sources. The requirements already contain the resulting behavioral additions: mobile support, customer user and vacancy administration, validated Kanban progression, collaboration, metadata-only email tracking, phone and WhatsApp outcome logging, activity attribution, and service reporting. The architecture delta adds explicit conceptual support for invitations, candidate notes, mentions, assessment revisions, unread user notifications, and inbound CC tracking.

Visual hierarchy, typography, spacing, card density, drag appearance, and other styling refinements remain prototype/design decisions and are not repeated as product requirements. Production UI should preserve the accepted behavior, responsive reading order, keyboard operation, and WCAG AA constraints without copying prototype implementation choices.

## Estimation Rules

- Estimate every outcome issue from `REQ-01` through `REQ-18` and all shared enabling issues.
- Use conditional ranges and state assumptions when an issue depends on an unresolved decision.
- Do not hide uncertainty inside a single precise estimate.
- Avoid counting a shared enabler again inside every outcome issue.
- Engineering may add component-level subissues after estimating the end-to-end outcome.
- Ready Slice 1 outcomes and unblocked enablers may start while decisions and spikes run in parallel.

## Material Blockers

- Approved lifecycle and transition matrix, including reopening and backward movement.
- Rejection and contact-outcome taxonomies and note correction policy.
- Follow-up and reminder policy beyond the accepted initial elapsed-time bands.
- Approved profile and CV field catalogue before transfer confirmation.
- Production transfer wording and minimized post-90-day evidence.
- Identity provider, authentication assurance, and recovery controls.
- HubSpot and application system-of-record boundaries.
- Email delivery and inbound tracking providers and sender-domain controls.
- Production availability, performance, backup, recovery, browser, accessibility verification, and support targets.

## Prototype Reference

Run the prototype from the separate `jobstream-ui-design` repository using its `prototype-handover-2026-08-31` tag. Follow `rendered-prototype.md` for setup and use `ux-specification.md` plus `wireframe.json` to understand the intended flows. Prototype feedback and usability records are supporting evidence, not implementation tickets.
