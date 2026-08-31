# Linear Backlog Catalog

Baseline: `HB-2026-08-31`

## Outcome Issues

| ID | Outcome issue title | Milestone | Classification | Estimate treatment |
| --- | --- | --- | --- | --- |
| `REQ-01` | Enforce authorized tenant and vacancy-scoped access | Slice 1 | Enabling | Conditional range for identity and future scope variants |
| `REQ-02` | Help recruiters identify the next candidate requiring work | Slice 1 | Earning | Estimate now |
| `REQ-03` | Present approved candidate and CV context safely | Slice 1 | Earning | Conditional range pending field catalogue |
| `REQ-04` | Confirm candidate-data transfer and provide the customer copy | Slice 1 | Earning | Estimate behavior; isolate legal-copy uncertainty |
| `REQ-05` | Start contact quickly and record only truthful evidence | Slice 1 | Earning | Estimate with inbound-provider assumption |
| `REQ-06` | Progress candidates through the standardized lifecycle | Slice 1 | Earning | Conditional range pending transition matrix |
| `REQ-07` | Preserve attributable notes and activity history | Slice 1 | Earning | Estimate core; isolate correction/taxonomy uncertainty |
| `REQ-08` | Make initial follow-up age and attention visible | Slice 1 | Earning | Estimate accepted initial clock only |
| `REQ-09` | Remind and escalate outstanding follow-up without noise | Slice 2 | Earning | Conditional range pending reminder policy |
| `REQ-10` | Give authorized users operational and service oversight | Slice 2 | Earning | Estimate reproducible approved metrics only |
| `REQ-11` | Support Dutch and English product-controlled content | Slice 1 | Earning | Estimate across relevant stories without double counting |
| `REQ-12` | Guide recruiters through one Jobstream workflow | Slice 1 | Earning | Estimate now |
| `REQ-13` | Enforce security, privacy, retention, and audit governance | Handover decisions and technical spikes | Enabling | Conditional range plus privacy/security decisions |
| `REQ-14` | Establish reliable source data and system boundaries | Handover decisions and technical spikes | Enabling | Architecture spike and conditional range |
| `REQ-15` | Preview and request the first-interview confirmation | Slice 1 | Earning | Estimate with provider assumption |
| `REQ-16` | Complete the core candidate journey on mobile web | Slice 1 | Earning | Cross-cutting estimate with explicit ownership |
| `REQ-17` | Let customer administrators maintain users and vacancy access | Slice 1 | Earning | Estimate now; recovery path is a separate enabler |
| `REQ-18` | Coordinate candidate decisions with attributable collaboration | Slice 1 | Earning | Estimate now |

## Shared Enabling Issues

| Key | Title | Supports |
| --- | --- | --- |
| `EN-01` | Select and implement identity, tenancy, and authorization controls | `REQ-01`, `REQ-13`, `REQ-17` |
| `EN-02` | Decide application data ownership and HubSpot synchronization | `REQ-02`, `REQ-06`, `REQ-10`, `REQ-14` |
| `EN-03` | Implement lifecycle, timeline, and activity foundations | `REQ-05` through `REQ-10`, `REQ-15`, `REQ-18` |
| `EN-04` | Implement transfer, export, retention, and audit controls | `REQ-03`, `REQ-04`, `REQ-13` |
| `EN-05` | Decide and implement CV and export file storage | `REQ-03`, `REQ-04`, `REQ-13`, `REQ-14` |
| `EN-06` | Integrate outbound transactional and inbound tracking email | `REQ-05`, `REQ-09`, `REQ-15`, `REQ-18` |
| `EN-07` | Implement durable workflow and reminder execution | `REQ-08`, `REQ-09`, `REQ-13`, `REQ-15` |
| `EN-08` | Establish production operations and recovery controls | All production requirements |
| `EN-09` | Establish accessibility, localization, browser, and responsive quality gates | `REQ-11`, `REQ-12`, `REQ-16` |

## Decision And Spike Issues

| Key | Decision or spike | Blocks |
| --- | --- | --- |
| `DEC-01` | Approve lifecycle states, transitions, reopening, and backward movement | `REQ-06`, `EN-03` |
| `DEC-02` | Approve rejection, contact-outcome, activity, and note-correction rules | `REQ-05`, `REQ-06`, `REQ-07`, `EN-03` |
| `DEC-03` | Approve reminder cadence, channels, recipients, suppression, and escalation | `REQ-09`, `EN-07` |
| `DEC-04` | Approve profile and CV fields visible before transfer | `REQ-03`, `EN-04`, `EN-05` |
| `DEC-05` | Approve transfer wording and minimized post-retention evidence | `REQ-04`, `REQ-13`, `EN-04` |
| `DEC-06` | Select identity provider, assurance, recovery, and provisioning controls | `REQ-01`, `REQ-17`, `EN-01` |
| `DEC-07` | Decide HubSpot and portal systems of record | `REQ-14`, `EN-02`, `EN-05` |
| `DEC-08` | Select outbound and inbound email providers and domain controls | `REQ-05`, `REQ-15`, `EN-06` |
| `DEC-09` | Define production non-functional and support targets | `EN-08`, `EN-09` |

## Issue Content Rules

Every outcome issue links to its requirement section and relevant rows in `traceability-matrix.md`. It summarizes the actor, outcome, acceptance behavior, scope boundary, dependencies, and estimate assumptions without copying the full specification. Enablers define an observable technical capability and supported requirement IDs. Decisions define the owner, required evidence, alternatives to assess, and the exact issues unblocked by the result.
