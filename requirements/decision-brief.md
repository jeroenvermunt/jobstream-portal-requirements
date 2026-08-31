# Requirements Decision Brief

## Purpose

This brief converts the partially answered [decision review template](open-questions-response-template.md) into a shorter set of requirement decisions, requirement impacts, and remaining blockers.

Use this file for review. Do not continue filling the large matrix unless a stakeholder needs the detailed checklist.

## Source

| Field | Value |
| --- | --- |
| Source answers | `D-01` and `D-02` in [open-questions-response-template.md](open-questions-response-template.md) |
| Legal source | [GDPR candidate-data transfer review](../source-material/gdpr-transfer-review-2026-07-29.md) |
| Product validation | Candidate interview-confirmation email decisions, 2026-08-24; review-session scope decisions, 2026-08-27 |
| Requirements updated | [customer-recruitment-portal-requirements.md](customer-recruitment-portal-requirements.md) |
| Update date | 2026-08-24 |
| Interpretation rule | Product decisions are applied as requirement changes. Legal, privacy, and security assertions remain subject to the appropriate owner approval. |

## Applied Decisions

| Decision | Requirement impact | Status |
| --- | --- | --- |
| The first release remains a lightweight customer-facing ATS workflow, not a narrow approval-only portal. | Keeps `REQ-01` through `REQ-15` as the product scope. | Marked approved in the review template; owner and source metadata still missing. |
| Explicit transfer confirmation is required for all customers through a concise contextual prompt. | Updates `REQ-03` and `REQ-04`; confirmation is the controller-transfer point and is independent of physical storage. Detailed obligations remain in the contract, while the prompt links to the privacy notice and primarily records the action. | Applied from legal and prototype review; short production confirmation text still needs approval. |
| The customer receives an independent copy at confirmation. | Updates `REQ-04`; a version-bound export package is prepared before confirmation and immediately made available afterwards. | Applied; package contents follow the approved field and document catalogue. |
| Per-candidate contracts require a commercial acknowledgement in the transfer prompt. | Updates `REQ-04`; one checkbox is required only for applicable contracts, and submission atomically stores distinct commercial and transfer evidence. | Applied from prototype review; billing trigger and incidental-candidate rules remain open. |
| Jobstream candidate-content retention after confirmation is 90 days. | Updates `REQ-13`; retention serves introduction/invoicing evidence and complaint handling under Jobstream's stated legitimate interest. | Applied from legal review; minimized evidence after 90 days needs a separate approved policy. |
| Customer users do not self-register. Accounts are assigned. | Updates `REQ-01`; account creation must happen through an approved admin route such as an admin portal or private API endpoint. | Applied; exact provisioning route remains open. |
| First-release contact support is minimal. | Updates `REQ-05`; use mailto links, WhatsApp links where available, and phone number display. | Applied. |
| Contact affordances need audit, and users must log real actions. | Updates `REQ-05` and `REQ-07`; shortcut invocation/display is distinct from a confirmed contact outcome. | Applied; exact action-log taxonomy remains open. |
| Rejection reason is important. | Updates `REQ-07`; rejection cannot complete without an explicit rejection reason. | Applied; exact reason vocabulary remains open. |
| The rest of the first-release scope rows in `D-02` were confirmed. | Reinforces `REQ-02`, `REQ-06`, `REQ-08`, `REQ-10`, `REQ-11`, `REQ-12`, `REQ-13`, and `REQ-14`. | Applied as confirmation, without adding new behavior. |
| The MVP sends one fixed first-interview confirmation from `no-reply@jobstream.nl` after a read-only preview and explicit user confirmation. | Adds `REQ-15`; customer branding, editable content, and additional template types remain outside this slice. | Applied from product-testing refinement, 2026-08-24. |
| Interview scheduling remains saved if email delivery fails. | Updates `REQ-06`, `REQ-07`, and `REQ-15`; email retry is separate and cannot duplicate the stage change. | Applied from product-testing refinement, 2026-08-24. |
| Candidate language selects Dutch or English, with Dutch as fallback, and replies route to the acting recruiter's verified work email. | Updates `REQ-11` and `REQ-15`. | Applied from product-testing refinement, 2026-08-24. |
| Complete core follow-up must work on modern phones from 360 CSS pixels. | Adds `REQ-16`. | Applied with a task-first mobile presentation. |
| Customer administrators manage users and vacancy assignments; assigned hiring managers complete the full workflow. | Updates `REQ-01` and adds `REQ-17`. | Applied; Jobstream handles last-administrator recovery. |
| Five-phase Kanban dragging starts the canonical detailed transition. | Updates `REQ-06` and promotes `CAN-08`. | Applied without direct state commits or removing click progression. |
| Notes/mentions and subjective assessments are distinct collaboration features. | Updates `REQ-07` and adds `REQ-18`. | Applied with in-product notifications and attributable assessment revisions. |
| Mailto CC receipt may verify an email attempt; phone and WhatsApp open guided logging. | Updates `REQ-05` and `REQ-07`. | Applied with metadata-only processing, verified sender, and idempotency. |
| Customer branding, product help, and customer suggestions are deferred. | Updates release and candidate scope. | Applied; prototype review tooling remains non-product infrastructure. |

## Requirement Changes Made

- `REQ-01` now states that customer accounts are assigned and open self-registration is out of scope.
- `REQ-03` permits approved profile and CV access before confirmation but withholds contact details and export.
- `REQ-04` now defines lightweight transfer confirmation, immediate customer export, idempotent evidence, download retry, and an in-prompt commercial acknowledgement where required.
- `REQ-13` now fixes post-confirmation candidate-content and export retention at 90 days and requires deletion or anonymization at expiry.
- `REQ-05` now defines first-release contact support as mailto, WhatsApp link, and phone-number display, with audit and user logging.
- `REQ-07` now requires an explicit rejection reason and logs user-recorded contact actions and outcomes.
- `REQ-15` defines a fixed, versioned first-interview confirmation with candidate-language selection, read-only preview, explicit combined confirmation, independent failure recovery, and auditable attempts.
- `REQ-16` defines task-first mobile support; `REQ-17` defines customer user and vacancy administration; `REQ-18` defines attributable collaboration.
- `REQ-05` now distinguishes shortcut invocation from verified metadata-only CC receipt and guided phone/WhatsApp outcome entry.
- The refinement summary, journey map, release slice, split decisions, backlog actions, and open-decision list now use transfer-confirmation terminology.

## Remaining Blocker Decisions

These are the questions worth answering next. Everything else can stay deferred or be handled during design.

| ID | Decision needed | Why it matters | Best owner |
| --- | --- | --- | --- |
| `B-01` | Who owns and approved the product-direction decision recorded in `D-01`? | The review template says approved, but owner/source fields are blank. | Product owner |
| `B-02` | What exact short confirmation sentence and privacy-notice link describe the transfer action? | Contract-level detail is intentionally not repeated in the prompt, but its concise production wording and linked notice still need approval and versioning. | Privacy owner and legal counsel |
| `B-03` | Which exact profile fields and CV sections are approved before transfer confirmation? | Pre-confirmation profile and CV access is selected but still requires a legally approved field catalogue. | Product and privacy |
| `B-04` | Does the per-candidate commercial acknowledgement create a billable event, and how are incidental or free candidates handled? | The interaction can record the acknowledgement, but downstream commercial consequences still require these rules. | Commercial owner |
| `B-05` | Is account provisioning through an admin portal, a private API endpoint, or both? | The product excludes self-registration but still needs a concrete provisioning path. | Product and security |
| `B-06` | What is the approved customer lifecycle, including terminal outcomes and backward/reopen rules? | It drives queue behavior, stage transitions, notes, reporting, and reminders. | Recruitment operations |
| `B-07` | What rejection reasons are required, and are they structured, free text, or both? | Rejection reason is now first-release scope but needs an approved vocabulary or capture rule. | Recruitment operations |
| `B-08` | Which actions must users log, and which fields are required per action? | The review says users must log all actions; implementation needs a bounded action taxonomy. | Recruitment operations and privacy |
| `B-09` | What starts, pauses, resets, and stops the follow-up clock? | Elapsed-time signals and reminders will be misleading without clock rules. | Recruitment operations |
| `B-10` | Can HubSpot support transfer confirmation, version-bound export, 90-day disposal, activity history, authorization, action logging, and the lifecycle? | The answer determines whether the original architecture remains viable. | Solution architect |
| `B-11` | Which minimized transfer-evidence fields may remain after 90 days, who may access them, and for how long? | Candidate content has a fixed limit, but longer-lived evidence needs separate purpose limitation and approval. | Privacy owner and legal counsel |
| `B-12` | What exact Dutch and English first-interview template copy and token formatting are approved for production? | The MVP behavior is decided, but the fixed production content needs an owner, approval, and version. | Product communications owner and recruitment operations |
| `B-13` | Which email delivery provider and sender-domain controls will be used? | Production sending requires provider selection, SPF/DKIM/DMARC configuration, failure handling, and operational ownership. | Solution architect and security/operations owner |

## Review Recommendation

Use this brief as the new working review artifact. The large decision template remains useful as raw detail, but the practical next step is to answer only the remaining `B-01` through `B-13` decisions, then revise the requirements again.
