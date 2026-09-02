# Requirements Decision Review Template

## Purpose

Use this document to confirm, correct, or defer the unresolved decisions in the proposed [customer recruitment portal requirements](customer-recruitment-portal-requirements.md).

The template is designed for a stakeholder review. It starts from the current proposal, so reviewers can confirm concrete scope items instead of answering broad open questions from scratch.

Nothing is approved merely because it appears in this document. Mark approval explicitly, name the decision owner, and cite the source.

## Review Details

| Field | Response |
| --- | --- |
| Review date |  |
| Participants |  |
| Facilitator |  |
| Requirements version or date reviewed |  |
| Supporting sources |  |
| Decision status after review | Options: Draft, Partly approved, Approved, Needs another review. Selected: |

## How To Complete This Template

- For rows with a current proposal, write `Confirm`, `Change`, `Move in`, `Move out`, `Defer`, or `Reject`.
- If a proposal changes, write the corrected wording in the notes column.
- Use `Approved` only when a named decision owner explicitly approved the decision.
- Use `Proposed` for a likely answer that still needs confirmation.
- Use `Deferred` when the item is intentionally moved out of the current release or review.
- Record additional observations in the notes log at the end instead of hiding them inside one answer.

## Decision Metadata

Use this block for each major decision where approval matters.

| Field | Response |
| --- | --- |
| Decision owner |  |
| Answered or approved by |  |
| Source and date |  |
| Status | Options: Open, Proposed, Approved, Deferred, Rejected. Selected: |
| Follow-up needed |  |

## Product Direction And First Release Scope

### D-01: Product Direction

**Current proposal:** The first production release is a lightweight customer-facing ATS workflow for traceable candidate follow-up. It includes explicit data-transfer confirmation and a customer export for every customer. Per-candidate contracts add a separate commercial approval before transfer confirmation.

**Related requirements:** `REQ-01` through `REQ-15`

| Decision | Response |
| --- | --- |
| Product direction | Selected: Confirm with changes. Options: Confirm as written, Confirm with changes, Reject |
| If changed, corrected product direction | Transfer confirmation is required for every customer and marks when the customer becomes an independent controller. The customer receives an independent copy. Per-candidate contracts require prior explicit commercial approval. |
| Main reason |  |
| Status | Selected: Approved. Options: Open, Proposed, Approved, Deferred |
| Owner, source, and date |  |

### D-02: Proposed In Scope For First Release

| Item | Related requirement | Confirm, change, or move out | Notes |
| --- | --- | --- | --- |
| Authenticated access with strict separation between customer companies | `REQ-01`, `REQ-13` | confirm | Account creation is not open for users, but users get an account assigned. Adding account can be either through an admin portal or via a private api endpoint |
| Work queue containing supplied candidates within the user's authorized scope | `REQ-02` | confirm |  |
| Candidate details and available CV needed for follow-up | `REQ-03` | confirm  |  |
| Contact shortcuts for supported channels, without claiming contact completed | `REQ-05` | change | at first, contacting contacts is minimally supported through a mailto or whatsapp link, and showing phone numbers. Audit of these actions is important. Also we require users to log all actions |
| Simple click-based customer pipeline from handoff to hire, rejection, or another approved terminal outcome | `REQ-06` | confirm |  |
| Required notes for stage changes, rejection, and closure, with chronological activity history | `REQ-07` | change | Reason of rejection is very important. |
| Current stage, latest recorded activity, and elapsed follow-up time for customer recruiters and authorized Jobstream users | `REQ-08`, `REQ-10` | confirm |  |
| Dutch and English product-controlled interface text | `REQ-11` | confirm |  |
| One standardized Jobstream recruitment process with contextual guidance | `REQ-12` | confirm |  |
| Approved privacy, audit, retention, and candidate-data controls for production | `REQ-13` | confirm |  |
| Reliable associations between candidate, vacancy, customer, work scope, stage, and activity data | `REQ-14` | confirm |  |
| Transfer confirmation, immediate customer export, and CV-level evidence for every customer | `REQ-04` | confirm | Legal review, 2026-07-29 |
| Fixed 90-day retention and disposal of post-confirmation candidate content | `REQ-13` | confirm | Legal review, 2026-07-29 |
| Read-only preview and explicit send of the fixed first-interview confirmation | `REQ-15` | confirm | Product testing, 2026-08-24 |

**Additional first-release items to add:**

| Item | Why it is needed in the first release | Owner | Source |
| --- | --- | --- | --- |
|  |  |  |  |

### D-03: Proposed Out Of Scope Or Later Scope

| Item | Proposed handling | Confirm excluded, move in, or change | Notes |
| --- | --- | --- | --- |
| Fine-grained assignment by department, location, vacancy, or individual recruiter beyond the minimum launch authorization model | Slice 2 |  |  |
| Automated reminders and escalation | Slice 2 |  |  |
| Advanced analytics, performance comparisons, and predictive recommendations | Later |  |  |
| External ATS imports or synchronization | Later |  |  |
| Full recruiter inbox, WhatsApp, or calling integration with verified communication outcomes | Later |  | Fixed platform-sent first-interview confirmation is separately in `REQ-15`. |
| Candidate email templates beyond the fixed first-interview confirmation | Later |  | Refine each additional template and trigger separately. |
| AI customer-support assistant | Later |  |  |
| Structured CV extraction and generated candidate profiles | Later |  |  |
| Candidate photos | Later |  |  |
| Raw or customer-originated candidate campaign feeds | Later |  |  |
| Drag-and-drop pipeline controls | Later |  |  |
| Billing, subscriptions, onboarding fees, or pricing automation | Later or separate workstream |  |  |
| Advanced filtering, matching, customer-configured queues, or full document management | Later |  |  |
| Customer-configurable lifecycle stages, fields, or workflows | Later |  |  |
| Customer self-service account administration | Not currently approved |  |  |
| Final visual branding while the brand book is unfinished | Later |  |  |

**Additional exclusions to record:**

| Item | Reason excluded | Review trigger or target horizon | Owner |
| --- | --- | --- | --- |
|  |  |  |  |

## Workflow Decisions

### D-04: Customer Candidate Lifecycle

**Current proposal:** Validate a simple customer-side lifecycle before implementation. The transcript mixes actions, contact outcomes, and durable stages, so this state model must be approved before sprint commitment.

**Related requirements:** `REQ-02`, `REQ-06`, `REQ-07`, `REQ-10`, `REQ-12`

| Proposed stage or outcome | Meaning to confirm or correct | Confirm, change, remove, or defer | Notes |
| --- | --- | --- | --- |
| Supplied by Jobstream | Candidate is handed over to the customer for follow-up. |  |  |
| Contact attempted or contacted | Recruiter has attempted contact or reached the candidate; exact wording needs normalization. |  |  |
| Intake planned | Candidate is scheduled for an intake or interview step. |  |  |
| Waiting for documents | Candidate or customer is waiting on required documents. |  |  |
| Offer or contract presented | Candidate has received an offer, contract, or comparable formal next step. |  |  |
| Hired or signed | Candidate reached a successful terminal outcome. |  |  |
| Rejected | Candidate reached an unsuccessful terminal outcome. |  |  |

| Lifecycle rule | Current proposal | Confirm or change | Notes |
| --- | --- | --- | --- |
| Interaction style | Simple click-based stage changes are enough for the first release. |  |  |
| Drag-and-drop | Exclude from first release. |  |  |
| Customer-specific stages | Exclude from first release. |  |  |
| Backward moves and reopening | Needs explicit approval before implementation. |  |  |
| Rejection reasons | Needs explicit approved list if required. |  |  |

### D-05: Notes And Activity History

**Current proposal:** Manual stage changes, rejection, and closure require a short note. Activity history must distinguish actual recorded outcomes from contact-shortcut clicks.

**Related requirements:** `REQ-05`, `REQ-06`, `REQ-07`, `REQ-13`

| Rule | Current proposal | Confirm or change | Notes |
| --- | --- | --- | --- |
| Stage change note | Required. |  |  |
| Rejection note | Required. |  |  |
| Closure note | Required. |  |  |
| Contact shortcut click | Record only that the shortcut was invoked, not that contact succeeded. |  |  |
| Activity history | Keep actor, time, previous stage, new stage, and note where applicable. |  |  |
| Note editing | Open decision: approve whether notes can be edited or corrected, and how corrections are shown. |  |  |
| Jobstream visibility | Authorized Jobstream users can see relevant activity history. |  |  |

### D-06: Follow-Up Clock And Service Expectation

**Current proposal:** Show elapsed follow-up time and attention signals, but do not hard-code a 24-hour or 48-hour policy until it is approved.

**Related requirements:** `REQ-08`, `REQ-09`, `REQ-10`

| Decision | Current proposal or options | Confirm or choose | Notes |
| --- | --- | --- | --- |
| Follow-up target | Options: 24 hours, 48 hours, Policy-dependent, Other. Selected: |  |  |
| Clock starts | Open decision: likely candidate handoff or first visible assignment. |  |  |
| Clock pauses | Open decision: define whether waiting for candidate, customer, documents, weekends, or holidays pause the clock. |  |  |
| Clock resets | Open decision: define which recorded outcomes reset elapsed time. |  |  |
| Clock stops | Open decision: define terminal outcomes or qualifying actions that stop the clock. |  |  |
| Working hours | Open decision: calendar hours, business hours, weekends, and holidays. |  |  |
| Attention signal | Show a visible indicator when the agreed threshold is exceeded. |  |  |

### D-07: Reminders And Escalation

**Current proposal:** Treat automated reminders and escalation as Slice 2 unless stakeholders confirm they are necessary for the first release.

**Related requirements:** `REQ-08`, `REQ-09`

| Reminder decision | Current proposal | Confirm or change | Notes |
| --- | --- | --- | --- |
| First release scope | Exclude automated reminders; keep elapsed-time visibility. |  |  |
| Trigger | Candidate remains beyond the agreed follow-up threshold with no qualifying outcome. |  |  |
| Recipient | Open decision: responsible recruiter, manager, Jobstream, or combination. |  |  |
| Channel | Open decision: in-product, email, WhatsApp, or other. |  |  |
| Cadence | Open decision: avoid duplicate daily noise. |  |  |
| Suppression | Open decision: stop or suppress after qualifying action, closure, reassignment, or pause. |  |  |
| Escalation owner | Open decision. |  |  |

## Access, Data, And Commercial Decisions

### D-08: Roles And Work Scope

**Current proposal:** First release must guarantee company-level tenant isolation. Finer assignments are future-proofed but can be deferred unless required for launch customers.

**Related requirements:** `REQ-01`, `REQ-02`, `REQ-10`, `REQ-13`

| Role or scope | Current proposal | Confirm, change, or defer | Notes |
| --- | --- | --- | --- |
| Customer recruiter | Can view and update candidates in authorized customer scope. |  |  |
| Customer recruitment manager | Can review progress in authorized customer scope if required. |  |  |
| Jobstream operations user | Can review customer progress across explicitly authorized Jobstream scope. |  |  |
| Customer self-service account admin | Not approved for first release. |  |  |
| Company-level isolation | Required for first release. |  |  |
| Department or location assignment | Defer unless launch customer requires it. |  |  |
| Vacancy assignment | Defer unless launch customer requires it. |  |  |
| Individual recruiter assignment | Defer unless launch customer requires it. |  |  |

### D-09: Candidate Fields, Documents, And Transfer

**Current proposal:** Before confirmation, show the authorized user the approved candidate profile and CV but not contact details or export. After confirmation, disclose approved contact details and provide the customer copy.

**Related requirements:** `REQ-03`, `REQ-04`, `REQ-05`, `REQ-13`

| Field or document | Current proposal | Confirm, change, or defer | Notes |
| --- | --- | --- | --- |
| Candidate identity and approved profile | Visible to an authorized user before confirmation; exact field catalogue requires legal approval. |  |  |
| Contact details | Hidden until transfer confirmation. |  |  |
| CV or source document | Visible before confirmation when approved; export remains blocked. |  |  |
| Customer export package | Generated before confirmation and immediately available afterwards; retry uses the same package for 90 days. |  |  |
| Jobstream notes | Open decision: define which notes, if any, customer users may see. |  |  |
| Customer notes | Visible to authorized customer and Jobstream users under approved policy. |  |  |
| Candidate photo | Exclude from first release unless privacy and fairness review approves it. |  |  |
| Structured CV extraction | Exclude from first release. |  |  |
| Automatic translation of user/source content | Exclude from first release. |  |  |

### D-10: Transfer Confirmation And Commercial Approval

**Current proposal:** Transfer confirmation and customer export apply to every customer. A configured per-candidate contract requires a separate commercial approval before transfer confirmation.

**Related requirements:** `REQ-04`, `REQ-13`

| Decision | Current proposal | Confirm or change | Notes |
| --- | --- | --- | --- |
| Transfer confirmation | Required for every customer before contact details or export become available. | Confirmed | Legal review, 2026-07-29 |
| Controller transfer point | Successful confirmation, independent of physical storage or completed download. | Confirmed | Legal review, 2026-07-29 |
| Customer copy | Prepare before confirmation and make immediately available afterwards. | Confirmed | Legal review, 2026-07-29 |
| Event recorded | Record customer, user, candidate context, vacancy, CV/document version, time, legal-text version, and export reference. | Confirmed | Legal review, 2026-07-29 |
| Commercial approval | Required before transfer confirmation only for configured per-candidate contracts. |  |  |
| Billable event | Open decision: confirm whether commercial approval, transfer confirmation, or another event creates a charge. |  |  |
| Pre-confirmation fields | Profile and CV access selected; exact approved catalogue and legal validation remain open. |  |  |
| Incidental or free candidates | Open decision: define treatment. |  |  |
| Dispute evidence | Candidate content and export are retained for 90 days; longer-lived minimized evidence requires separate legal approval. |  |  |

## Governance And Architecture Decisions

### D-11: Security, Privacy, Audit, And Retention

**Current proposal:** These controls are production blockers. They must be approved before a production release, even if some implementation details are selected later.

**Related requirements:** `REQ-01`, `REQ-07`, `REQ-13`, `REQ-14`

| Control area | Current proposal | Confirm or change | Notes |
| --- | --- | --- | --- |
| Authentication assurance | Open decision: approve method, MFA rule, session duration, and account recovery. |  |  |
| Tenant authorization | Required. Candidate access must be checked for direct requests as well as list views. |  |  |
| Audit events | Required at CV level for transfer confirmation and other material workflow and access events. |  |  |
| Notes retention | Open decision: retention, correction, deletion, and access rules. |  |  |
| Candidate records, CV, and export retention | Delete or anonymize 90 days after transfer confirmation. | Confirmed | Legal review, 2026-07-29 |
| Activity history retention | Open decision: retention and disclosure rules. |  |  |
| Minimized transfer evidence | Open decision: approve exact fields, audience, purpose, and retention after candidate-content disposal. |  |  |
| Data-subject requests | Open decision: owner and process. |  |  |
| Photo and identity blurring | Not approved without explicit privacy and fairness review. |  |  |
| Legal documents | Update the data-transfer agreement and privacy notice before production use. | Confirmed | Legal review, 2026-07-29 |

### D-12: Architecture And System Of Record

**Current proposal:** Do not assume the original HubSpot-only or HubSpot CMS architecture is sufficient. Compare the expanded workflow with HubSpot capabilities before committing.

**Related requirements:** `REQ-01`, `REQ-07`, `REQ-09`, `REQ-13`, `REQ-14`

| Architecture decision | Options or current proposal | Choose or update | Notes |
| --- | --- | --- | --- |
| Overall direction | Options: HubSpot only, HubSpot plus application data store, Separate portal architecture, Not decided. Selected: |  |  |
| Candidate and vacancy source | HubSpot is current source for existing recruitment data and associations. |  |  |
| Customer lifecycle stage | Open decision: decide system of record and synchronization direction. |  |  |
| Notes and activity history | Open decision: decide durable store and Jobstream access model. |  |  |
| Authorization scope | Must preserve tenant isolation across selected stores. |  |  |
| Reminders | If included, decide where reminder policy and state live. |  |  |
| Failure handling | Open decision: define behavior when HubSpot or application sync fails. |  |  |

### D-13: Oversight Metrics

**Current proposal:** First release should support basic operational visibility only. Advanced analytics and comparisons are deferred until metrics, audiences, and fairness controls are approved.

**Related requirements:** `REQ-08`, `REQ-10`, `REQ-13`

| Metric or view | Current proposal | Confirm, change, or defer | Notes |
| --- | --- | --- | --- |
| Current stage per candidate | Include. |  |  |
| Latest recorded activity | Include. |  |  |
| Elapsed follow-up time | Include after clock policy is approved. |  |  |
| Untouched or stalled candidates | Include after clock policy is approved. |  |  |
| Grouping by customer | Include for authorized Jobstream users. |  |  |
| Grouping by department, location, vacancy, or recruiter | Defer unless launch scope requires it. |  |  |
| Cross-customer performance comparison | Defer. |  |  |
| Predictive recommendations | Defer. |  |  |
| Employee surveillance metrics | Not approved without policy and privacy review. |  |  |

## Production Readiness Decisions

These topics were not validated in discovery. Record an explicit requirement or a justified decision to defer each one before production release.

| ID | Topic | Required decision | Response | Status and owner | Source |
| --- | --- | --- | --- | --- | --- |
| `PR-01` | Availability | Required service hours, planned maintenance, and availability target |  |  |  |
| `PR-02` | Performance | Expected volumes and response or processing targets for critical actions |  |  |  |
| `PR-03` | Accessibility | Required accessibility standard and verification approach |  |  |  |
| `PR-04` | Browser and device support | Supported browsers, versions, screen sizes, and mobile behavior |  |  |  |
| `PR-05` | Backup and restore | Data covered, frequency, retention, restore target, and test ownership |  |  |  |
| `PR-06` | Disaster recovery | Recovery time, recovery point, fallback process, and test ownership |  |  |  |
| `PR-07` | Support service levels | Support hours, contact route, severity levels, response targets, and ownership |  |  |  |

## Additional Observations And Notes

Use this section for observations, transcript evidence, stakeholder comments, or new ideas discovered during review. Keep evidence separate from interpretation.

### Note Template

| Field | Response |
| --- | --- |
| Short title |  |
| Observation or quote |  |
| Source and date or transcript timestamp |  |
| Raised by |  |
| Affected actor or customer segment |  |
| Related requirement or candidate item |  |
| Interpretation and why it matters |  |
| Suggested handling | Options: Update existing requirement, Add requirement, Add candidate item, Add risk or assumption, No change. Selected: |
| Proposed follow-up question or action |  |
| Owner |  |
| Status | Options: Unreviewed, Needs clarification, Accepted, Rejected, Deferred. Selected: |

### Notes Captured During Review

| ID | Short title | Evidence or observation | Suggested handling | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| `NOTE-01` |  |  |  |  |  |
| `NOTE-02` |  |  |  |  |  |
| `NOTE-03` |  |  |  |  |  |

## Decision Summary

Complete this after the review.

| Outcome | IDs | Next action | Owner | Due date |
| --- | --- | --- | --- | --- |
| Approved decisions |  | Update the affected requirements and acceptance examples |  |  |
| Proposed decisions awaiting approval |  | Obtain named approval |  |  |
| Still open |  | Schedule clarification |  |  |
| Deferred |  | Record review trigger or target horizon |  |  |
| Rejected |  | Remove or revise affected scope |  |  |
| New requirements or candidate items |  | Refine and trace to source evidence |  |  |

## Sign-Off

| Role | Name | Decision scope | Approval or comments | Date |
| --- | --- | --- | --- | --- |
| Product owner |  |  |  |  |
| Recruitment operations |  |  |  |  |
| Commercial owner |  |  |  |  |
| Privacy owner |  |  |  |  |
| Security owner |  |  |  |  |
| Solution architect |  |  |  |  |
