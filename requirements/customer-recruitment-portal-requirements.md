# Customer Recruitment Portal Requirements

## Document Status

| Field | Value |
| --- | --- |
| Status | Engineering handover baseline for estimation; unresolved product and policy decisions remain explicit |
| Prepared | 2026-06-21 |
| Latest product validation | Accepted prototype review decisions through checkpoint `CP-21`, 2026-08-31 |
| Handover baseline | `HB-2026-08-31`; estimate `REQ-01` through `REQ-18`, with conditional ranges for blocked rules |
| Primary evidence | [`Requirement Discovery transcript`](../meetings/Requirement%20Discovery/transcript.txt) |
| Legal evidence | [`GDPR candidate-data transfer review`](../source-material/gdpr-transfer-review-2026-07-29.md) |
| Previous baseline | [`initial_requirements.md`](../source-material/initial_requirements.md) and [`initial_specifications.md`](../source-material/initial_specifications.md) |
| Alignment analysis | [`requirement-discovery-alignment.md`](requirement-discovery-alignment.md) |

The identifiers in this document are requirement identifiers created for durable traceability. Linear issues retain these identifiers but remain planning records rather than the canonical specification. `Ready` means the business behavior is sufficiently clear for design and backlog refinement; it does not mean all implementation dependencies are resolved.

The transcript is an automatic Dutch transcription without reliable speaker labels. Direct statements are treated as stakeholder evidence, not as approval by a named decision-maker. Unclear details are marked `Needs clarification` or `Candidate or deferred`.

## Refinement Summary

The original approval portal is too small for the workflow described in discovery. The proposed product is a lightweight, customer-facing recruitment workflow in which customer recruiters receive Jobstream candidates, contact them, move them through a standardized customer pipeline, record outcomes, and make follow-up visible to Jobstream.

The smallest useful product is therefore not candidate approval alone. It is an end-to-end handoff and follow-up path covering authorized access, candidate review, explicit data-transfer confirmation, a customer export, contact initiation, stage progression, notes, elapsed-time visibility, and Jobstream oversight. Legal review defines the customer confirmation as the transfer point at which the customer becomes an independent controller for the confirmed candidate data. This transfer point is independent of where Jobstream physically stores the data. Where a per-candidate contract applies, the same lightweight confirmation prompt also requires a concise commercial acknowledgement and stores it as distinct evidence.

The strongest requirements are the customer pipeline, traceable notes and activity, timely follow-up, tenant isolation, Jobstream visibility, controlled transfer confirmation and export, a standardized Dutch/English experience, task-first mobile support, customer-managed vacancy-scoped access, and attributable team collaboration. Contact support includes metadata-only email tracking through a unique CC address and guided phone and WhatsApp outcome logging. Candidate profile and CV access before confirmation is the selected product direction, but still requires explicit legal validation before production.

## Context And Hierarchy

### Product Goal

Enable customer recruiters to follow up Jobstream candidates promptly and consistently while giving Jobstream enough evidence to understand candidate progress, support the customer, and address stalled follow-up.

### Intended Behavior Changes

| Actor | Current problem | Intended behavior change | Business effect | Evidence of value |
| --- | --- | --- | --- | --- |
| Customer recruiter | Candidates are handed over through fragmented channels and may not be followed up promptly. | Work assigned candidates through one clear, guided process. | Fewer candidates are lost because follow-up is late or unclear. | Each active candidate has a visible stage, latest action, elapsed time, and supporting note. |
| Jobstream recruiter or operations user | Jobstream must manually ask customers what happened to candidates. | Review customer follow-up and intervene using shared activity evidence. | Less manual chasing and stronger customer accountability. | Jobstream can identify untouched or stalled candidates without requesting a separate spreadsheet update. |
| Customer recruitment manager | Work across recruiters, departments, or locations is difficult to compare. | Review candidate progress within the manager's authorized scope. | Operational issues become visible during progress reviews. | The manager can see where candidates are active, stalled, hired, or rejected. |
| Candidate | Slow or inconsistent follow-up and manually composed appointment messages create uncertainty. | Receive timely contact, clear progression, and a consistent confirmation when the first interview is scheduled. | Better candidate experience and a higher chance of reaching a recruitment outcome. | The system shows whether follow-up occurred and whether an interview confirmation was requested successfully. |

The transcript also discusses Jobstream commercial users, customer owners, and integration partners. Their needs affect policy and packaging, but they are not all confirmed portal users.

### Capability Hierarchy

```text
Goal: customers follow up Jobstream candidates promptly and visibly
  -> Customer recruiters work candidates instead of only approving them
    -> Authorized candidate queue and details
    -> Contact shortcuts
    -> Customer-side pipeline, notes, and closure
    -> Fixed interview-confirmation email with preview and manual send
  -> Jobstream can detect and address stalled follow-up
    -> Activity history and elapsed-time indicators
    -> Reminders and operational oversight
  -> The product remains safe and easy to adopt
    -> Tenant and assignment-based access
    -> Standardized workflow and onboarding guidance
    -> Dutch and English UI
    -> Privacy, audit, and data-governance controls
  -> Commercial and technical variants remain controlled
    -> Data-transfer confirmation and customer export for all customers
    -> In-prompt commercial acknowledgement for per-candidate contracts
    -> HubSpot and application data boundary
    -> Deferred integrations and advanced capabilities
```

### Journey Map

| Activity | Customer task | Jobstream task | Main requirement |
| --- | --- | --- | --- |
| Access work | Sign in and see authorized candidates | Maintain appropriate customer scope | `REQ-01`, `REQ-02` |
| Review candidate | Understand the candidate and available supporting information | Supply accurate candidate and vacancy context | `REQ-03` |
| Confirm transfer | Use the lightweight prompt before using contact data or exporting a copy; acknowledge commercial terms in the same prompt where the contract requires it | Atomically record the applicable evidence, prepare the customer copy, and retain only approved evidence | `REQ-04`, `REQ-13` |
| Initiate contact | Use minimal supported contact routes and log the actual action | Observe that a shortcut was invoked without treating it as completed contact | `REQ-05` |
| Record and progress | Select an outcome or stage and add a note | Review the resulting history | `REQ-06`, `REQ-07` |
| Confirm first interview | Preview and explicitly send the fixed appointment confirmation while scheduling the interview | Maintain the approved templates and expose send status without claiming delivery | `REQ-15` |
| Follow up | Return to candidates that need action | Identify stale candidates and prompt intervention | `REQ-08`, `REQ-09` |
| Close | Record hire, rejection, or another agreed terminal result | Understand the final outcome | `REQ-06`, `REQ-07` |
| Monitor | Review own or team workload | Review activity across authorized customers and scopes | `REQ-10` |
| Learn the process | Follow Jobstream's prescribed process in the preferred language | Provide clear guidance | `REQ-11`, `REQ-12` |

## Proposed Release Slices

These are refinement proposals, not committed release dates or priorities.

### Slice 0: Validate The Product And Risk Model

Classification: `Learning`

- Validate the journey and terminology with the three existing customers proposed in the interview.
- Decide the initial customer pipeline, roles, data visibility, follow-up clock, and note rules.
- Test whether a simple click-based prototype lets a customer recruiter complete the end-to-end workflow.
- Decide the privacy and architecture constraints before estimating production delivery.

### Slice 1: Complete A Traceable Candidate Follow-Up

Classification: `Earning`, supported by `Enabling` work

- An authorized customer recruiter can see a supplied candidate and relevant details.
- The recruiter can confirm the candidate-data transfer, immediately obtain an independent copy, use minimal contact routes, update the candidate stage, preview and send the fixed first-interview confirmation, and leave a traceable history.
- The recruiter and Jobstream can see the current stage, latest activity, and elapsed follow-up time.
- The interface supports Dutch and English and follows one standardized Jobstream process.
- The complete core journey is usable on supported mobile browsers from 360 CSS pixels.
- Customer administrators manage users and vacancy assignments, while assigned team members can complete the candidate workflow.
- Recruiters can use validated Kanban progression and leave attributable notes, mentions, and subjective assessments.
- Data-transfer confirmation and customer export are included for all customers; per-candidate contracts add one commercial acknowledgement to the same prompt.

This is the selected first delivery slice because it crosses the entire customer journey and produces observable operational value. Splitting frontend, API, database, and HubSpot work into separate release items would not produce a usable recruitment outcome.

### Slice 2: Scale Customer Operations

Classification: `Earning`

- Add department, location, vacancy, and recruiter assignment scopes.
- Add reminders and escalations based on the agreed follow-up policy.
- Add first-use guidance and basic customer/Jobstream operational views.
- Expand reporting only to agreed, governable metrics.

### Later Horizons

Classification: `Candidate or deferred`

- External ATS imports and synchronization.
- Full recruiter inbox, WhatsApp, or calling integration with verified communication outcomes.
- Additional candidate email templates for follow-up interviews, rescheduling, cancellation, offers, rejection, or general status updates.
- AI support assistant through IPster.
- Structured CV extraction, generated profiles, and candidate photos.
- Raw-candidate campaign feeds, advanced analytics, customer branding, product help and suggestions, and billing automation.

## Refined Requirements

### REQ-01: Authorized Tenant And Work-Scope Access

| Attribute | Value |
| --- | --- |
| Status | Confirmed |
| Classification | Enabling |
| Actors | Customer recruiter, customer recruitment manager, Jobstream operations user |
| Journey position | Access work |

**Outcome:** Users can work only with candidate data they are authorized to access, while Jobstream can provide support across an explicitly authorized operational scope.

**Requirement:** The portal shall require authenticated access and enforce candidate visibility and actions by customer tenant. It shall support finer assignment scopes such as department, location, vacancy, or recruiter where the agreed customer operating model requires them.

**In scope**

- Strict separation between customer companies.
- Multiple users within one customer organization.
- Assigned customer accounts created through an approved administrative route, such as an admin portal or private API endpoint.
- A future-proof authorization model for department, location, vacancy, and recruiter assignments.
- Separate authorization for Jobstream operational oversight.

**Out of scope**

- Open self-registration for customer users.
- A specific identity provider, HubSpot Membership, or two-factor mechanism until security requirements are approved.
- Public self-registration or administration outside the controlled behavior in `REQ-17`.

**Business rules**

1. A customer user must never see or modify a candidate belonging only to another customer tenant.
2. Candidate access must be checked for direct requests as well as list views.
3. A broad Jobstream view must be granted by role; it must not result from customer membership.
4. Customer users must be assigned an account through an approved administrative process; they must not create their own production account through public self-registration.
5. The exact combination of department, location, vacancy, and recruiter assignment is an open decision.
6. First-release customer work scope is assigned by vacancy. Customer administrators maintain those assignments under `REQ-17`.
7. Customer administrators and customer team members share candidate-workflow permissions for assigned vacancies; administration capability is separate.

**Representative examples**

```text
Given a recruiter authenticated for Customer A
And a candidate belongs only to Customer B
When the recruiter requests the candidate
Then the candidate is not disclosed or modifiable
```

```text
Confirmation required:
Given a recruiter is assigned only to Location North
When the recruiter opens the candidate queue
Then only candidates assigned to Location North are available
```

**Dependencies and risks:** Role definitions, identity management, account-provisioning route, tenant associations, privacy policy, and the chosen application architecture.

**Evidence:** Transcript 00:04:27-00:04:48, lines 92-96; 00:34:33-00:35:15, lines 663-675. Decision review response in `open-questions-response-template.md`, `D-02`, confirms assigned accounts and rejects open user self-registration. This expands the baseline from company-only access to possible sub-organizational scopes.

### REQ-02: Candidate Work Queue

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter |
| Journey position | Access work, review candidate |

**Outcome:** A recruiter can immediately identify the candidates that require work and their current progress.

**Requirement:** The portal shall show each customer recruiter an overview of authorized Jobstream candidates with enough workflow context to identify the current stage and whether action is outstanding.

**In scope**

- Supplied candidates within the user's authorized scope.
- Current customer-side stage.
- An elapsed-time or last-activity signal once its governing rule is agreed.
- Access to the candidate detail.

**Out of scope**

- Advanced filtering, matching, and customer-configured queue layouts.
- Customer-originated or raw candidates unless a later service variant is selected.

**Business rules**

1. The queue population must be derived from tenant and assignment authorization.
2. The default source population is candidates handed over by Jobstream.
3. The queue must not expose unauthorized candidate details through summaries or counts.

**Representative example**

```text
Given a qualified candidate has been supplied to an authorized customer recruiter
When the recruiter opens the candidate queue
Then the candidate is visible with the current customer-side stage
And the recruiter can open the candidate for follow-up
```

**Dependencies and risks:** `REQ-01`, agreed candidate population, customer lifecycle, and source-data associations.

**Evidence:** Transcript 00:00:14-00:00:47, lines 6-17; 00:09:49-00:11:35, lines 184-215. This replaces the approval-stage-only queue with an operational work queue.

### REQ-03: Candidate Profile And Available CV

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actors | Customer recruiter |
| Journey position | Review candidate |

**Outcome:** A recruiter has enough candidate context to decide and perform the next recruitment action.

**Requirement:** Before data-transfer confirmation, the portal shall present an authorized recruiter with the approved candidate profile and any approved CV or source information, while withholding contact details and export. After confirmation under `REQ-04`, the portal shall disclose the approved contact details and make the confirmed customer copy available.

**In scope**

- Candidate details already available from the agreed source.
- Display or access to an approved CV before confirmation where needed to evaluate the candidate.
- Contact details and customer export only after the required data-transfer confirmation.
- Source documents remaining in their original language.

**Out of scope**

- General document management.
- AI-based CV extraction, generated profiles, and photos in the first slice.
- A final pre-confirmation field list until product and privacy stakeholders approve it.

**Business rules**

1. An authorized customer user may view the approved candidate profile and CV before confirmation, but may not access contact details or export a copy.
2. The product must distinguish a source CV from system-generated structured data.
3. Missing optional profile data must not be represented as known information.
4. The decision to expose profile and CV data before confirmation requires explicit legal validation before production.

**Representative example**

```text
Given an authorized recruiter opens a supplied candidate
And an approved CV is available for that candidate
When the candidate profile is shown
Then the recruiter can access the approved details and CV
And the document remains in its source language
But contact details and export remain unavailable until transfer confirmation
```

**Dependencies and risks:** Approved field catalogue, legal approval of pre-confirmation access, transfer-confirmation policy, retention policy, commercial model, data quality, and candidate identity rules.

**Evidence:** Transcript 00:00:32-00:01:40, lines 14-38; 00:07:44-00:08:17, lines 143-151; 00:37:53-00:39:27, lines 734-760.

### REQ-04: Candidate Data Transfer Confirmation, Export, And Commercial Acknowledgement

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter, Jobstream commercial or operations user, privacy owner |
| Journey position | Confirm transfer |

**Outcome:** The customer deliberately confirms when it becomes an independent controller, receives its own copy of the candidate data, and can then use the contact details without navigating a legal-heavy approval flow.

**Requirement:** The product shall require an authorized customer user to explicitly confirm the candidate-data transfer before contact details or export become available. The confirmation is the transfer point at which the customer becomes an independent controller for the confirmed data, regardless of its physical storage location. The interaction shall be a concise contextual prompt; detailed legal obligations remain in the applicable customer contract and the prompt links to the privacy notice. On successful confirmation, the product shall create one immutable, version-bound transfer record and immediately make an independent customer copy available. Where a per-candidate contract applies, the prompt shall require one concise commercial acknowledgement and atomically store distinct commercial-approval and transfer-confirmation evidence.

**In scope**

- A deliberate data-transfer confirmation for every customer.
- CV-level logging of customer, user, candidate context, vacancy, document and document version, confirmation time, legal-text version, and export-package reference.
- Immediate generation and availability of a version-bound customer export package.
- Retry access to the same export package during the 90-day retention period when automatic download does not complete.
- A concise commercial acknowledgement in the same prompt for configured per-candidate contracts.
- A short transfer consequence and privacy-notice link instead of repeating contract-level legal copy.

**Out of scope**

- Billing automation or a final charging model.
- Unapproved rules for free or incidental candidates.
- Treating download completion or Jobstream deletion as the legal transfer point.
- Candidate photos or other fairness-sensitive presentation choices until privacy and fairness review is complete.

**Business rules**

1. Contact details and export are unavailable until an authorized user confirms the transfer.
2. The system must prepare the export package before committing the confirmation.
3. Confirmation must be idempotent per customer and candidate context: retrying it must not create a second transfer record or a different export package.
4. Once committed, confirmation remains valid when automatic download fails; the customer can retry the same package while it is retained.
5. The transfer record identifies the exact CV or source-document version included in the customer copy.
6. The applicable commercial model determines whether a commercial acknowledgement is required. When required, it and the transfer confirmation are committed atomically as distinct evidence from one submission.
7. Whether commercial acknowledgement creates a billable event and how incidental candidates are treated remain commercial decisions.
8. The exact legal confirmation text and privacy-notice wording must be approved and versioned before production.

**Representative examples**

```text
Given an authorized recruiter has reviewed a supplied candidate and CV
And the export package can be prepared
When the recruiter confirms the candidate-data transfer
Then one transfer record is stored for the customer and candidate context
And the approved contact details become available
And the version-bound customer copy is immediately available for download
And the 90-day retention period starts at the confirmation time
```

```text
Given a customer contract requires per-candidate commercial acknowledgement
And the commercial acknowledgement has not been selected
When an authorized recruiter opens the transfer prompt
Then transfer confirmation remains unavailable
And the commercial acknowledgement is presented in the same prompt
```

```text
Given a transfer was confirmed and the automatic download did not complete
When the recruiter requests the customer copy again within 90 days
Then the same version-bound export package is provided
And no second transfer record is created
```

**Dependencies and risks:** Commercial policy, approved legal text, export-package definition, pre-confirmation access validation, audit requirements, and `REQ-13`.

**Evidence:** Transcript 00:08:05-00:09:58, lines 149-186; 00:39:31-00:40:46, lines 761-779. Decision review response in `open-questions-response-template.md`, `D-01`, establishes universal confirmation with additional commercial evidence for per-candidate contracts. Later prototype review combines these into one lightweight prompt without removing distinct evidence. [`GDPR candidate-data transfer review`](../source-material/gdpr-transfer-review-2026-07-29.md) defines confirmation as the transfer point, requires a customer copy, CV-level logging, and 90-day Jobstream retention for the stated post-transfer purposes.

### REQ-05: Candidate Contact Shortcuts

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter |
| Journey position | Initiate contact |

**Outcome:** Recruiters can begin candidate follow-up with less friction while the system records only what it can truthfully observe.

**Requirement:** After an authorized customer user has confirmed the candidate-data transfer, the portal shall provide email, WhatsApp, and phone shortcuts. Email shortcuts shall include a unique Jobstream CC tracking address; phone and WhatsApp shortcuts shall open contact logging with the channel and current local time selected. The portal shall distinguish shortcut invocation, verifiable tracking evidence, and user-reported outcomes.

**In scope**

- Opening a mailto link with the candidate as recipient and a unique opaque Jobstream tracking address as visible CC.
- Opening a WhatsApp link where a supported phone number is available.
- Revealing a phone number and then offering an explicit `tel:` call action.
- Prefilling a recipient and, if approved, a message template.
- Recording that the user invoked a contact shortcut or viewed a supported contact affordance where technically feasible and approved.
- User logging of actual contact actions and outcomes.
- Metadata-only processing of a CC copy received from the acting user's verified work email.

**Out of scope**

- Claiming that a call, message, WhatsApp message, or email was completed or answered based only on a click or display event.
- Full inbox, message-body, attachment, reply, open, delivery, calling, or WhatsApp synchronization.

**Business rules**

1. A contact shortcut or displayed contact value is available only after the `REQ-04` transfer confirmation.
2. A shortcut invocation, phone-number display, and confirmed contact outcome are different activity types.
3. The recruiter must log the actual phone or WhatsApp outcome. A received, verified CC copy may automatically record the email attempt.
4. Mailto links, WhatsApp links, and phone number display are the first-release contact mechanism unless a later integration is approved.
5. The tracking address uses an opaque, single-invocation token and contains no candidate, customer, or user identifier.
6. Email is recorded as sent only after the CC copy is received and its sender matches the acting user's verified work email. Removing the CC or opening the shortcut alone does not record a send.
7. The tracking processor retains correlation, sender, recipient, subject, receipt time, and message ID, and discards body content and attachments after processing.
8. Duplicate inbound events must not create duplicate activity or lifecycle changes.
9. A first valid tracked email moves `Approved for contact` to `Contact attempted` and stops the initial follow-up clock. It never moves a later-stage candidate backward.
10. Phone and WhatsApp logging preselects only channel and current local time. The user must still select the real outcome.

**Representative example**

```text
Given an authorized recruiter has confirmed the candidate-data transfer
And the candidate has an email address
When the recruiter invokes the email shortcut
Then the configured email application opens with the candidate as recipient and a unique Jobstream tracking CC
And the portal records that the shortcut was invoked
When Jobstream receives the CC copy from the recruiter's verified work email
Then one attributable email-attempt event is recorded
And the initial follow-up stage and clock are updated once
```

**Dependencies and risks:** Candidate contact policy, device/browser support, transfer-confirmation rules, action-log taxonomy, approved templates, and channel policy.

**Evidence:** Transcript 00:17:28-00:20:00, lines 327-367. Decision review response in `open-questions-response-template.md`, `D-02`, limits first-release contact support to mailto, WhatsApp links, and phone number display, with audit and user logging.

### REQ-06: Customer-Side Candidate Pipeline

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actors | Customer recruiter, Jobstream operations user |
| Journey position | Record and progress, close |

**Outcome:** Both customer and Jobstream can see where every supplied candidate is in the customer recruitment process.

**Requirement:** An authorized recruiter shall be able to move a candidate through an agreed customer-side lifecycle from Jobstream handoff to a terminal customer outcome.

**Proposed stage model for validation**

1. Supplied by Jobstream.
2. Approved for contact.
3. Contact attempted.
4. Contacted.
5. Interview scheduled.
6. Waiting for internal approval.
7. Approved.
8. Offer made.
9. Hired or signed.
10. Rejected.

The transcript mixes actions, contact outcomes, and durable stages. The final state model must normalize these concepts before implementation.

**In scope**

- Viewing and selecting the next agreed stage or outcome.
- Recording actor, time, previous stage, and new stage.
- Structured first-interview details and the combined confirmation behavior in `REQ-15`.
- Terminal outcomes for hire/sign and rejection.
- Click-based progression and validated drag-and-drop between the five visible phases.

**Out of scope**

- Customer-specific lifecycle configuration.
- An invented transition matrix before recruitment operations approves one.

**Business rules**

1. Only an authorized user may change a candidate's customer-side stage.
2. Every stage change must remain traceable in the activity history.
3. Rejection requires the rejection-reason behavior in `REQ-07`; closure requires the note behavior in `REQ-07`.
4. Reopening and backward transitions are open decisions.
5. `Offer made` is an explicit lifecycle stage and event after `Approved`; it is not an alias for internal approval or negotiation.
6. The initial transition from `Contacted` to `Interview scheduled` follows `REQ-15`; missing email prerequisites or provider failure must not roll back the saved interview stage.
7. Dragging is an alternative trigger for the canonical transition and never directly commits a detailed lifecycle state.
8. Only permitted forward phase destinations are enabled. A valid drop opens the existing transition panel and commits only after its required details are accepted.
9. Click-based progression remains available for keyboard, touch, and other contexts where dragging is unsuitable.

**Representative example**

```text
Given a supplied candidate is assigned to an authorized recruiter
When the recruiter records the agreed next stage and required note or rejection reason
Then the current stage changes
And the previous stage, new stage, actor, time, and supporting record are available in the history
```

**Dependencies and risks:** Approved lifecycle, transition rules, outcome vocabulary, HubSpot mapping, `REQ-07`, and `REQ-15`.

**Evidence:** Transcript 00:02:40-00:04:16, lines 55-90; 00:10:14-00:11:29, lines 191-213.

### REQ-07: Required Notes And Activity History

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter, Jobstream operations user |
| Journey position | Record and progress, close, monitor |

**Outcome:** Candidate decisions and follow-up remain understandable without relying on separate chats, calls, or spreadsheets.

**Requirement:** The portal shall maintain a chronological activity history for each candidate, provide an authorized newest-first activity feed across candidates in the viewer's active scope, and require a short note for manual stage changes and closure. Rejection shall require an explicit rejection reason.

**In scope**

- Stage-change events and their notes.
- Rejection reason and, where required by the approved workflow, a supporting rejection note.
- Closure notes.
- Shortcut-invocation events from `REQ-05`.
- User-logged contact actions and outcomes.
- First-interview schedule and email request, provider acceptance, failure, and retry events from `REQ-15`.
- Actor and event time.
- Visibility to authorized customer and Jobstream users.
- Candidate and vacancy context on authorized cross-candidate activity.
- Vacancy and event-type filters over a default period of the last 30 days.
- Attributable candidate notes containing mentions of authorized users.
- In-product mention notifications linking to the candidate.
- Per-user negative, positive, or strong-positive subjective assessments and their revision history.

**Out of scope**

- Automatic proof that external communication occurred.
- A final note retention or editing policy until governance decisions are made.

**Business rules**

1. A manual stage change or closure cannot complete without a note.
2. A rejection cannot complete without an explicit rejection reason.
3. History must distinguish a user's claim of contact from an observed system action.
4. Existing history must not silently change when a current stage changes again.
5. Whether notes can be edited and how corrections are represented remains open.
6. The exact rejection-reason vocabulary remains open until recruitment operations approves it.
7. Cross-candidate activity must be newest first, must distinguish system-observed from user-reported events, and must omit candidates outside the active authorized scope.
8. Activity timestamps must be stored as machine-readable ISO timestamps; localized dates are presentation only.
9. Email-provider acceptance must remain distinguishable from candidate delivery, receipt, opening, or reading.
10. Only users currently authorized for the candidate may be mentioned or receive its notification.
11. Subjective assessments are informational. They do not rank candidates or change stages, rejection, or team-level outcomes.
12. Each user has one current assessment per candidate and may revise it; every change remains attributable in history.

**Representative examples**

```text
Given an authorized recruiter is rejecting a candidate
When no rejection reason has been provided
Then the rejection is not completed
And the recruiter is asked to record the reason
```

```text
Given a recruiter invoked a phone shortcut
When Jobstream reviews the activity history
Then the history shows that the shortcut was invoked
But does not state that the candidate was reached
```

**Dependencies and risks:** Retention, edit/correction policy, rejection-reason vocabulary, privacy review, a durable activity store, and `REQ-15`.

**Evidence:** Transcript 00:03:14-00:03:27, lines 65-69; 00:12:47-00:14:52, lines 240-275; 00:19:36-00:20:17, lines 362-371. Decision review response in `open-questions-response-template.md`, `D-02`, makes rejection reason an important first-release requirement.

### REQ-08: Follow-Up Age And Service Expectation

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actors | Customer recruiter, customer recruitment manager, Jobstream operations user |
| Journey position | Follow up, monitor |

**Outcome:** Users can recognize candidates at risk of being lost because follow-up is late.

**Requirement:** The portal shall show how long a candidate has awaited the relevant next action and whether the candidate is within or beyond the agreed follow-up expectation.

**In scope**

- Elapsed calendar time since Jobstream delivered the candidate.
- Three visible age bands while no valid contact attempt has been logged.
- A visible indication of candidates requiring attention.

**Out of scope**

- Working-hours, holiday, pause, or reset calculations.
- A second follow-up clock after the initial contact attempt.
- Unsupported claims that a candidate is unmotivated or that a customer has failed.

**Business rules**

1. The clock starts when Jobstream delivers the candidate and uses elapsed calendar hours.
2. Before a valid contact attempt is logged, the interface shows `Follow up · new (<24h)`, `Follow up · 24-48h`, or `Follow up · older than 48h`.
3. The first valid user-logged contact attempt or outcome stops the initial clock and changes the state to `Follow-up recorded`.
4. The clock does not pause or reset. Later follow-up timing remains outside this requirement.

**Representative example**

```text
Given a candidate was delivered 26 calendar hours ago
And no valid contact attempt or outcome has been recorded
When the recruiter views the candidate queue
Then the candidate is labelled "Follow up · 24-48h"

Given the recruiter then records a valid contact attempt
When the queue is refreshed
Then the candidate is labelled "Follow-up recorded"
And the delivery clock no longer advances
```

**Dependencies and risks:** Reliable delivery and activity timestamps, a valid contact-action taxonomy under `REQ-05`, and consistent elapsed-time calculation.

**Evidence:** Transcript 00:24:43-00:27:27, lines 460-520; 00:27:28-00:28:05, lines 521-529. Confirmed through prototype usability session `UT-001` on 5 August 2026.

### REQ-09: Follow-Up Reminders And Escalation

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actors | Customer recruiter, customer recruitment manager, Jobstream operations user |
| Journey position | Follow up |

**Outcome:** Outstanding candidate actions are prompted without creating notification fatigue.

**Requirement:** The product shall be able to remind the responsible user about candidates that still require action and support an agreed escalation path for prolonged inactivity.

**In scope**

- Reminders derived from `REQ-08` and recorded activity.
- A controlled cadence that avoids duplicate daily noise.
- Visibility of unresolved reminders in the product.

**Out of scope**

- A final email, WhatsApp, or in-product channel choice.
- Customer-configurable automation rules until the standardized default is validated.

**Business rules requiring confirmation**

1. Reminders apply only while a qualifying action remains outstanding.
2. A new candidate notification and an overdue reminder must not unintentionally create duplicate noise.
3. Cadence, recipients, channel, suppression, and escalation are open decisions.

**Representative example**

```text
Confirmation required:
Given a candidate remains beyond the agreed follow-up threshold
And no qualifying outcome is recorded
When the reminder policy is evaluated
Then the responsible user receives the agreed reminder
And repeated reminders follow the agreed suppression rule
```

**Dependencies and risks:** `REQ-08`, assignment rules, notification infrastructure, contact preferences, and operational escalation ownership.

**Evidence:** Transcript 00:12:06-00:12:25, lines 226-228; 00:24:43-00:28:05, lines 460-529.

### REQ-10: Jobstream Operational Oversight

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Jobstream operations user, customer recruitment manager |
| Journey position | Monitor |

**Outcome:** Jobstream can support progress reviews and customer managers can understand the services Jobstream delivered without manually collecting status updates.

**Requirement:** Authorized oversight users shall be able to review candidate progress and latest activity across the customers, recruiters, departments, or locations in their permitted scope. Authorized customer managers shall also be able to review a neutral delivery-cohort summary of services delivered by Jobstream within their customer scope.

**In scope**

- Candidate, current stage, latest activity, latest note, responsible scope, and elapsed-time signal.
- Grouping or narrowing by customer and agreed organizational scope.
- Identification of untouched and stalled candidates.
- Customer-manager-only service reporting by delivery period and vacancy.
- Delivered-candidate totals; strict-match and additional-candidate distributions; first-contact time bands; historical interview and offer-made attainment; and hired/signed, rejected, and still-in-process outcomes.

**Out of scope**

- Cross-customer performance benchmarking in the first slice.
- Predictive conversion claims or recommendations without validated data.
- Employee surveillance measures not approved through policy and privacy review.

**Business rules**

1. Oversight data must respect the viewer's authorization.
2. The view must distinguish no recorded action from evidence that no action occurred outside the system.
3. Metrics must be based on defined, reproducible events.
4. Every service-summary figure uses candidates delivered during the selected period and vacancy as the same denominator/cohort.
5. A `Strict match` satisfies the jointly agreed qualification criteria. An `Additional candidate` was delivered under the customer's broader receive-all-candidates service choice.
6. Contact speed is elapsed calendar time from delivery to the first valid logged contact attempt or outcome, with bands within 24 hours, within 24–48 hours, after 48 hours, and not yet contacted.
7. Interview and offer-made totals use historical events, so later hire or rejection does not erase earlier attainment.
8. The customer service summary is informational: it has no work-queue links, urgency styling, employee comparisons, predictive claims, or cross-customer comparisons.
9. Customer recruiters cannot see the service-summary navigation item or obtain its metrics through direct access.

**Representative example**

```text
Given a Jobstream operations user may review Customer A
When the user reviews active candidates
Then the user can identify each candidate's current stage, latest recorded activity, and elapsed follow-up time
And candidates outside the user's authorized scope are not disclosed
```

**Dependencies and risks:** `REQ-01`, `REQ-07`, `REQ-08`, agreed organizational structure, and governance of employee-level reporting.

**Evidence:** Transcript 00:04:27-00:04:48, lines 92-96; 00:09:49-00:10:32, lines 184-199; 00:15:33-00:17:28, lines 294-326.

### REQ-11: Dutch And English Interface

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter, Jobstream user |
| Journey position | Across the journey |

**Outcome:** Dutch-speaking and English-speaking recruiters can use the workflow in a supported interface language.

**Requirement:** The portal shall provide Dutch and English versions of product-controlled interface text, guidance, and system messages.

**In scope**

- Navigation, labels, actions, validation, guidance, and notifications controlled by the product.
- A defined way to select or determine the supported language.

**Out of scope**

- Automatic translation of CVs, notes, or other user-supplied content.
- Languages other than Dutch and English.

**Business rules**

1. Product-controlled text must be available in both supported languages.
2. User-provided and source content remains in its original language unless a separate translation capability is approved.

**Representative example**

```text
Given a recruiter uses the English interface
When the recruiter opens a candidate with a Dutch CV
Then product labels and guidance are shown in English
And the CV remains in Dutch
```

**Dependencies and risks:** Translation ownership, content workflow, notification templates, and design support for language length.

**Evidence:** Transcript 00:37:27-00:38:30, lines 726-741.

### REQ-12: Standardized Workflow And Guided Adoption

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | New or occasional customer recruiter |
| Journey position | Learn the process, across the journey |

**Outcome:** A recruiter can understand what to do next with limited training, and customers follow a consistent Jobstream operating model.

**Requirement:** The product shall guide recruiters through one standardized Jobstream recruitment process and explain the next expected action without requiring each customer to configure its own ATS.

**In scope**

- First-use explanation of the workflow.
- Contextual explanation of the current stage and expected next action.
- A consistent default process and terminology.
- Supporting a short onboarding session or content asset.

**Out of scope**

- Customer-specific fields, workflows, and lifecycle configuration in the initial product.
- An AI assistant as a prerequisite for guidance.
- Final visual branding while the brand book remains unfinished.

**Business rules**

1. Core recruitment behavior is prescribed by Jobstream rather than configured per customer.
2. Guidance must not claim that an optional action is mandatory unless the approved process requires it.
3. Product guidance and operational training content must use the same approved process.

**Representative example**

```text
Given a recruiter opens the portal for the first time
When the recruiter starts working with a supplied candidate
Then the product explains the current stage and the expected next action using the standardized process
```

**Dependencies and risks:** Approved process, content owner, customer validation, localization, and UX design.

**Evidence:** Transcript 00:24:43-00:25:24, lines 458-473; 00:28:41-00:31:10, lines 540-595; 00:49:36-00:50:52, lines 957-991.

### REQ-13: Security, Privacy, And Audit Governance

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Enabling |
| Actors | Candidate, customer user, Jobstream privacy and security stakeholders |
| Journey position | Across the journey |

**Outcome:** Candidate data and user activity are handled under explicit access, accountability, and retention rules.

**Requirement:** Before production release, Jobstream shall approve security and privacy rules for authentication, candidate visibility, activity logging, notes, transfer-confirmation events, source documents, retention, correction, and deletion. After transfer confirmation, Jobstream shall retain candidate content for no more than 90 days for evidence of introduction relevant to per-CV invoicing and for complaint handling, based on Jobstream's stated legitimate interest under Article 6(1)(f) GDPR. The product shall enforce deletion or anonymization at expiry.

**In scope**

- Authentication assurance and session requirements.
- Tenant and role authorization.
- An auditable CV-level record of each transfer confirmation.
- A fixed 90-day retention period for post-confirmation candidate content and generated export packages.
- Automated, auditable deletion or anonymization at expiry, including copies and search-index data.
- A separately governed minimized transfer-evidence record after candidate content is removed.
- Data minimization, access, correction, and deletion policy.
- Privacy and fairness review of obscuring or revealing identity and photos.
- Governance and disposal of notification recipients, reply addresses, token snapshots, templates, requests, attempts, and provider references.
- Updated data-transfer agreement and privacy notice before production use.

**Out of scope**

- Indefinite retention of candidate content or export packages after confirmation.
- Assuming that the minimized transfer-evidence record may be retained indefinitely.
- Selecting two-factor authentication or another mechanism without an approved security requirement.

**Business rules requiring confirmation**

1. The 90-day period starts at the successful transfer-confirmation timestamp.
2. Candidate profile data, contact data, CV/source-document copies, generated export packages, and derived search-index data retained for the transfer context must be deleted or anonymized at expiry.
3. Deletion or anonymization must be recorded without retaining the removed candidate content in the operational audit event.
4. Only a minimized transfer-evidence record may remain after 90 days, and its exact fields, purpose, audience, and retention term require separate legal approval before production.
5. Audit and activity events must have a defined purpose and authorized audience and must not expose more personal data than necessary.
6. Retention and correction rules must also cover notes and activity history.
7. Photo use requires explicit fairness and privacy review.
8. First-interview notification data in `REQ-15` must not outlive the applicable candidate-content retention unless a separately approved minimized evidence rule permits specific fields.

**Representative example**

```text
Given a transfer was confirmed 90 days ago
When the retention workflow reaches the confirmation expiry
Then the retained candidate content and export package are deleted or anonymized
And derived search-index data is removed
And the disposal outcome is recorded
But only legally approved minimized transfer evidence may remain
```

**Dependencies and risks:** Privacy owner, security owner, approved minimized-evidence policy, data inventory, deletion coverage across all stores and backups, updated data-transfer agreement and privacy notice, and operational procedures.

**Evidence:** Transcript 00:06:04-00:06:14, lines 119-120; 00:14:41-00:14:56, lines 273-276; 00:39:31-00:40:46, lines 761-779. [`GDPR candidate-data transfer review`](../source-material/gdpr-transfer-review-2026-07-29.md) recommends a purpose-bound 90-day period after confirmation for introduction/invoicing evidence and complaint handling, with legitimate interest under Article 6(1)(f) GDPR.

### REQ-14: Source Data And System Boundary

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Enabling |
| Actors | Jobstream operations user, delivery team |
| Journey position | Supports all activities |

**Outcome:** The portal uses consistent candidate, vacancy, customer, status, and activity data without committing prematurely to an architecture that cannot support the expanded workflow.

**Requirement:** The solution shall preserve reliable associations between candidate, vacancy, customer tenant, and authorized work scope. Jobstream shall be able to access the resulting customer-stage and activity data. The storage and synchronization design shall be selected only after comparing the expanded requirements with HubSpot's capabilities.

**In scope**

- HubSpot as the current source for existing recruitment data and associations.
- Mapping customer-side lifecycle and activity data to an agreed system of record.
- An explicit decision between HubSpot-only, HubSpot plus an application data store, or a separate portal architecture.
- Preservation of tenant isolation across the selected data stores.

**Out of scope**

- Assuming the original HubSpot CMS plus serverless proposal remains sufficient.
- External customer ATS synchronization in the initial slice.
- Moving the existing campaign-closure workflow into the portal without a new decision.

**Business rules**

1. Each candidate exposed through the portal must have a reliable customer scope.
2. Customer-stage and activity history must remain available to authorized Jobstream users.
3. A storage choice must not weaken tenant isolation or audit behavior.
4. The baseline's campaign-closure rejection rule remains external and was not revalidated in the interview.

**Representative example**

```text
Given a candidate is associated with a vacancy and customer in the agreed source system
When the candidate is supplied through the portal and progressed by the customer
Then the customer scope remains intact
And the current stage and activity history are available to authorized Jobstream users
```

**Dependencies and risks:** Architecture decision record, HubSpot capability assessment, data model, migration strategy, and `REQ-13`.

**Evidence:** Baseline requirements lines 6-18 and specifications lines 6-16; transcript 00:06:19-00:07:39, lines 122-142; 00:19:36-00:20:19, lines 362-373; 00:34:33-00:35:15, lines 663-675.

### REQ-15: Preview And Send First-Interview Confirmation

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter, candidate |
| Journey position | Record and progress, confirm first interview |

**Outcome:** Candidates receive consistent and accurate appointment information when their first interview is scheduled, without requiring the recruiter to compose the message manually.

**User story:** As an authorized customer recruiter, I want to preview and explicitly confirm a fixed Jobstream interview-confirmation email while scheduling the first interview, so that the candidate receives the agreed appointment details and I can see whether the platform accepted the send request.

**In scope**

- The initial transition from `Contacted` to `Interview scheduled`.
- A read-only preview of recipient, sender, reply address, subject, and rendered body before confirmation.
- Fixed, versioned Dutch and English Jobstream templates selected from the candidate's preferred communication language, with Dutch as the fallback.
- Dynamic values for candidate name, vacancy, customer, interview date and time, timezone, format, optional location or meeting link, and recruiter contact details.
- One explicit confirmation that saves the interview schedule and creates a durable email request.
- Sending from `no-reply@jobstream.nl` with the acting recruiter's verified work email as `Reply-To`.
- Separate, traceable schedule and email-request outcomes, including provider acceptance, failure, and retry.
- A manual-notification instruction when platform sending is unavailable or fails.

**Out of scope**

- Portal-user editing of template subject, body, branding, styling, or token placement.
- Follow-up-interview, rescheduling, cancellation, offer, rejection, or general status-update templates.
- Customer-specific templates, sender domains, branding, or content.
- Recruiter inbox synchronization, inbound-message handling, open/read tracking, or claims that the candidate received or read the message.
- Allowing the portal user to add or correct the candidate email address inside this flow.

**Business rules**

1. Only an authorized recruiter who may perform the stage transition may preview or confirm the email.
2. The candidate-data transfer in `REQ-04` must already be confirmed before this action is available.
3. Preview uses the exact fixed template version and token values that will be submitted when the recruiter confirms.
4. The preview is read-only. Template content and Jobstream branding are controlled centrally and are not configurable by the customer or portal user.
5. Candidate preferred communication language selects the Dutch or English template. Missing or unsupported preference defaults to Dutch.
6. A valid candidate email and verified recruiter work email are required to request platform sending. If either is unavailable, the recruiter may still schedule the interview, but the portal must explain that the candidate must be notified manually.
7. The final confirmation must persist the interview schedule and a durable, idempotent email request so repeated clicks cannot duplicate the stage transition or request.
8. An email-provider failure does not roll back the truthful interview stage. The failure is recorded separately, and the recruiter is offered a retry that retries only the email.
9. When sending fails, the portal must also tell the recruiter to update the candidate manually through their own inbox if needed.
10. Provider acceptance means only that the provider accepted the request. The portal must not describe acceptance as candidate delivery, receipt, or reading.
11. The timeline must distinguish `Interview scheduled`, `Candidate email requested`, `Candidate email accepted`, `Candidate email failed`, and `Candidate email retry requested` events.
12. Notification records and token data follow the authorization, privacy, audit, correction, and retention rules in `REQ-13`.

**Representative examples**

```text
Given an authorized recruiter is scheduling the first interview
And the candidate has an English communication preference and valid email address
And the recruiter has a verified work email address
When the recruiter reviews the fixed English preview and confirms
Then the interview is saved as scheduled
And one versioned email request is created from no-reply@jobstream.nl
And replies are directed to the recruiter's verified work email
And the timeline records the schedule and email-request outcomes separately
```

```text
Given the recruiter confirmed an interview and the email provider rejects the request
When the failure is returned
Then the interview remains scheduled
And the failed send is recorded without claiming delivery
And the recruiter can retry only the email
And the recruiter is told to notify the candidate manually if necessary
```

```text
Given the candidate has no valid email address
When the recruiter confirms the first interview schedule
Then the interview is saved
And no platform email request is created
And the recruiter is told to notify the candidate manually
```

**Dependencies and risks:** Approved Dutch and English template copy and token catalogue, source and governance of candidate communication language, verified recruiter work email, email delivery provider, sender-domain SPF/DKIM/DMARC configuration, idempotent command and delivery-attempt handling, and `REQ-06`, `REQ-07`, `REQ-11`, `REQ-13`, and `REQ-14`.

**Evidence:** Product-testing finding and refinement decisions recorded on 2026-08-24. The selected MVP slice is one fixed first-interview confirmation; later template types remain candidate work.

### REQ-16: Core Mobile Web Experience

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Customer recruiter, customer team member |
| Journey position | Across the core candidate journey |

**Outcome:** Authorized users can follow up candidates promptly when away from a desktop.

**Requirement:** The core candidate journey shall use a task-first mobile presentation on current and previous major Safari iOS and Chrome Android releases from 360 CSS pixels in portrait orientation.

**In scope**

- Prioritized candidate queue, candidate and CV review, contact shortcuts, contact logging, notes, stage progression, and interview confirmation.
- A concise candidate summary, supporting-detail tabs, and a persistent stage-appropriate next action.
- Kanban as a secondary mobile representation.
- The same authorization, transfer, audit, validation, language, and accessibility rules as desktop.

**Out of scope**

- Native iOS or Android applications.
- Mobile-only business rules or reduced security controls.
- Kanban as the default mobile landing view.

**Business rules**

1. Mobile access exposes exactly the candidate scope available to the same user on desktop.
2. Core follow-up never requires a desktop-only completion step.
3. Dragging is not required on touch devices when the equivalent explicit move action is available.

### REQ-17: Customer User And Vacancy Assignment Administration

| Attribute | Value |
| --- | --- |
| Status | Ready for design and backlog refinement |
| Classification | Earning with enabling security work |
| Actors | Customer administrator, customer team member, Jobstream support |
| Journey position | Administer access |

**Outcome:** Customers can maintain recruitment access when responsibilities change without exposing unrelated vacancies or relying on Jobstream for every routine change.

**Requirement:** A customer administrator shall be able to invite and deactivate customer users and assign them to one or more vacancies. Jobstream shall provide the controlled recovery route when the last administrator is unavailable.

**Business rules**

1. Public self-registration is unavailable; access begins through an administrator invitation.
2. A customer administrator and a customer team member have the same candidate-workflow permissions within assigned vacancies; only the administrator manages users and assignments.
3. Deactivation prevents new access without removing historical attribution.
4. The final active customer administrator cannot deactivate themselves or be deactivated through routine customer administration.
5. Assignment changes affect future access but do not rewrite historical activity.
6. Jobstream handles last-administrator recovery and transfer through a separately secured operational process.

**Out of scope:** Customer-defined roles, department/location combinations, cross-customer administration, and customer control over Jobstream roles.

### REQ-18: Attributable Candidate Collaboration

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Earning |
| Actors | Authorized customer team member |
| Journey position | Review and collaborate |

**Outcome:** Authorized colleagues can coordinate candidate decisions without losing context in separate messages.

**Requirement:** Authorized users shall be able to add attributable candidate notes, mention authorized colleagues, receive in-product mention notifications, and record a personal subjective assessment.

**Business rules**

1. A note identifies author and time and appears in candidate history.
2. A user may mention only an active colleague who currently has access to the candidate.
3. A mention creates an unread in-product and e-mail notification linking to the candidate; 
4. Each user may hold one current assessment per candidate: negative, positive, or strong positive.
5. A user may revise their assessment, and every revision remains attributable in history.
6. Assessments never change ranking, stage, rejection, or another user's assessment.

**Out of scope:** candidate-visible feedback, shared aggregate ratings, automated decisions, and employee-performance ranking.

### LRN-01: Validate The Workflow With Existing Customers

| Attribute | Value |
| --- | --- |
| Status | Ready |
| Classification | Learning |
| Actors | Product owner, design/research team, three existing customer teams |
| Journey position | Before delivery commitment |

**Learning outcome:** Confirm that the proposed workflow reflects customer behavior and identify missing or unnecessary steps before implementation estimates and sprint scope are committed.

**Learning requirement:** Create a journey-level prototype from these proposed requirements and evaluate it with three existing customers.

**Questions to test**

- Can recruiters identify which candidate needs action and what to do next?
- Does the proposed stage model reflect their real follow-up process?
- Can recruiters record an outcome without ambiguity or unnecessary work?
- Do managers and Jobstream understand the activity evidence consistently?
- Which candidate fields, reminders, scopes, and commercial variants are actually necessary?

**Completion evidence**

- Findings are recorded per customer without treating frequency alone as priority.
- Confirmed behavior, disagreements, and new gaps are traced back to the relevant requirement.
- Requirements and the prototype are revised before implementation estimation.

**Evidence:** Transcript 00:47:47-00:48:44, lines 925-940; 00:49:55-00:50:10, lines 966-974.

## Candidate Or Deferred Requirements

| Identifier | Candidate capability | Why it is not ready | Evidence and next validation |
| --- | --- | --- | --- |
| `CAN-01` | Comparative, predictive, recruiter-performance, cross-customer, and other advanced analytics | Desired metrics, audiences, data quality, fairness, and governance are not agreed. Neutral single-customer service-delivery reporting under `REQ-10` is not comparative analytics. | Transcript 00:15:33-00:17:28, lines 294-326. Define approved operational KPIs and governance before any predictive or comparative metrics. |
| `CAN-02` | AI customer-support assistant | Use cases are examples, and the IPster contract, ownership, data access, and guardrails are unclear. | Transcript 00:21:36-00:24:42, lines 399-459. Obtain documentation and validate recurring questions with Dylan and Lisa. |
| `CAN-03` | External ATS imports and synchronization | It is described as a new service or custom integration, with unresolved system direction and cost. | Transcript 00:31:13-00:36:12, lines 597-703. Select target systems and a commercial integration model first. |
| `CAN-04` | Full recruiter inbox, WhatsApp, or calling integration | `REQ-15` adds one fixed platform-sent first-interview confirmation, but inbox synchronization, inbound messages, customer-authored content, and verified communication tracking remain unresolved. | Transcript 00:12:25-00:13:09, lines 229-247; 00:17:28-00:20:00, lines 327-367. Validate channel ownership, APIs, consent, and evidence semantics. |
| `CAN-11` | Additional platform-sent candidate email templates | The first slice covers only the initial interview confirmation; rescheduling, cancellation, follow-up interviews, offers, rejection, and general status updates need their own triggers, rules, and approved copy. | Product-testing finding, 2026-08-24. Add templates as separately refined vertical slices rather than a generic editable email feature. |
| `CAN-05` | Structured CV extraction and generated profiles | Source data, extraction quality, necessity, consent, and presentation are unresolved. | Transcript 00:38:30-00:39:14, lines 742-753. Test whether source CV access is sufficient first. |
| `CAN-06` | Candidate photos | A photo is only tentatively proposed and raises necessity, consent, and bias concerns. | Transcript 00:39:14-00:40:31, lines 754-775. Require privacy and fairness approval before refinement. |
| `CAN-07` | Raw-candidate campaign feed | Supplying raw rather than qualified candidates changes the service and commercial model. | Transcript 00:40:46-00:41:19, lines 780-790. Define the target customer segment and Jobstream/customer responsibilities. |
| `CAN-08` | Drag-and-drop pipeline | Promoted into `REQ-06` after review-session evidence supported frequent Kanban dragging and product review approved the validated-transition design. | Review session 1, 19:21-20:26 and 44:11-45:16; product decision 2026-08-27. Retained here only for historical traceability. |
| `CAN-09` | Billing, subscriptions, onboarding fees, and pricing automation | Many pricing ideas are discussed without a decision or stable product package. | Transcript 00:41:20-00:47:46, lines 792-924. Resolve commercial packaging outside the core workflow refinement. |
| `CAN-10` | Advanced filtering, matching, and full document management | These capabilities are explicitly excluded from the initial concept and not established as necessary later. | Transcript 00:00:42-00:01:20, lines 17-30. Reconsider only if customer validation demonstrates a material need. |

## Split Decisions

| Considered split | Decision | Rationale |
| --- | --- | --- |
| Approval portal first, ATS later | Rejected as the default product slice | Approval alone does not let the dominant customer segment perform or expose candidate follow-up. |
| Frontend, API, HubSpot, and database as separate delivery slices | Rejected for product delivery | Component slices do not provide an end-to-end recruiter or Jobstream outcome. Technical work may still be tracked as enabling tasks. |
| Core follow-up before reminders and advanced reporting | Selected | Candidate review, contact initiation, stage update, note, and basic oversight form a coherent useful path. Automation can deepen it later. |
| Lightweight transfer confirmation and customer export for all customers, with a commercial acknowledgement for per-candidate contracts | Selected | Legal review defines confirmation as the controller-transfer point and requires an independent customer copy and CV-level log. Review feedback moved contract-level legal detail out of the platform and combined any commercial acknowledgement into the same prompt while retaining distinct evidence. |
| Learning before production implementation | Selected | Exact workflow, privacy, role, and architecture decisions materially affect scope and estimate reliability. |
| Five-phase dragging over detailed states | Selected | Dragging starts the same validated transition as click progression and never bypasses detailed state, note, interview, or rejection rules. |
| Fixed first-interview confirmation before a general email catalogue | Selected | One versioned, read-only template completes a meaningful candidate communication path without introducing customer-authored content, branding, or broad automation. |
| Save the interview independently from email delivery | Selected | The recruitment stage remains truthful if the provider fails; retry targets only the email request and cannot duplicate the stage change. |

## Open Decisions

| Decision | Why it matters | Best stakeholder role |
| --- | --- | --- |
| Record the named owner and source for the approved product-direction decision. | The decision review marks the direction as approved, but owner and source metadata are still blank. | Product owner |
| What is the approved customer lifecycle and transition model? | It governs queue behavior, notes, reporting, reminders, and data mapping. | Recruitment operations lead |
| Which rejection reasons are required, and are they structured, free text, or both? | Rejection reason is now a first-release requirement, but the approved vocabulary and data model are missing. | Recruitment operations lead |
| Which actions require notes or action logs, and can notes be edited or corrected? | It determines accountability, usability, and audit behavior. | Recruitment operations and privacy owner |
| Which event starts, pauses, resets, and stops the follow-up clock? | Without this, elapsed-time signals and reminders will be misleading. | Recruitment operations lead |
| Is the expectation 24 hours, 48 hours, or policy-dependent? | It affects customer commitments and operational escalation. | Product owner and operations lead |
| Which roles and assignments control company, department, location, vacancy, and recruiter access? | The current company-only rule cannot safely support large customers. | Product owner and security owner |
| Which exact profile fields and document sections are approved for access before transfer confirmation? | Profile and CV access before confirmation is selected, but its field catalogue and legal basis still require explicit approval. | Product and privacy owners |
| What exact confirmation text and privacy-notice wording describe the transfer to an independent controller? | The transfer mechanism is decided, but production copy must match the updated agreement and privacy notice. | Privacy owner and legal counsel |
| Which minimized confirmation fields may remain after 90 days, for what audience, and for how long? | Candidate content has a fixed 90-day limit; the separate evidence record still needs a lawful, minimized retention policy. | Privacy owner and legal counsel |
| Does per-candidate commercial acknowledgement create a billable event, and how are incidental candidates treated? | The acknowledgement can be captured, but its commercial consequence still requires an approved rule. | Commercial owner |
| Which authentication assurance and account-management controls are required? | Account assignment is confirmed, but the identity provider, MFA rule, admin portal versus private API route, and recovery process are still open. | Security owner |
| What are the retention, access, correction, and deletion rules for notes and activity? | Activity history adds personal and employee-related data not covered by the old draft. | Privacy owner |
| Can HubSpot support the required lifecycle, history, authorization, and reminders? | The answer determines whether the old architecture is viable. | Solution architect |
| Which reminder channels and cadence are acceptable? | Poor policy risks missed candidates or notification fatigue. | Operations lead and customer representatives |
| Which basic oversight metrics are allowed in the first release? | Undefined metrics can mislead users and create fairness concerns. | Product, operations, and privacy owners |
| What exact Dutch and English first-interview template copy and token formatting are approved for production? | The behavior and token catalogue are defined, but production wording, formatting, and content ownership need approval and version control. | Product communications owner and recruitment operations |
| Which email delivery provider and sender-domain controls will be used? | Production sending requires provider selection, SPF/DKIM/DMARC configuration, failure handling, and operational ownership. | Solution architect and security/operations owner |

No validated requirements were elicited for availability, performance, accessibility standard, browser/device support, backup/recovery, disaster recovery, or support service levels. These are not implicitly approved and must be added before production readiness.

## Backlog Actions

| Action | Items | Rationale |
| --- | --- | --- |
| Revise now | Replace the old approval-only goal with `REQ-01` through `REQ-15` as the proposed product scope. | Discovery expands the product into customer-side candidate follow-up, and later product testing adds the fixed first-interview confirmation. |
| Revise now | Replace contact-detail reveal with a lightweight explicit transfer confirmation, immediate customer export, and an in-prompt commercial acknowledgement where required. | Legal review defines the controller-transfer point and evidence; review feedback reduces interaction pressure without removing the action. |
| Revise now | Add fixed 90-day disposal of post-confirmation candidate content and export packages to `REQ-13`. | Legal review supplies the purpose, stated legal basis, and retention period. |
| Revise now | Add `REQ-15` as the fixed first-interview confirmation slice and separate it from recruiter mailto shortcuts and full inbox integration. | Product testing identified a concrete candidate communication gap with sufficiently bounded MVP behavior. |
| Add candidate | `CAN-01` through `CAN-11` | These ideas have potential value but lack sufficient policy, actor, or dependency clarity. |
| Clarify | `REQ-01`, `REQ-03`, `REQ-06`, `REQ-08`, `REQ-09`, `REQ-13`, `REQ-14` | Material business rules or architecture decisions block sprint-ready acceptance. |
| Defer | External ATS synchronization, full recruiter communication integration, additional candidate email templates, AI support, CV extraction, photos, raw candidates, customer branding, product help and suggestions, and billing automation | They are later horizons or separate workstreams, not required for the approved first release. |
| Remove or merge | Remove the standalone universal approve/reject story and merge it into `REQ-04`. | Keeping it as the product center would preserve the original scope error. |

## Readiness Summary

| Readiness | Items |
| --- | --- |
| Ready for design and backlog refinement | `REQ-02`, `REQ-04`, `REQ-05`, `REQ-07`, `REQ-10`, `REQ-11`, `REQ-12`, `REQ-15`, `REQ-16`, `REQ-17`, `REQ-18`, `LRN-01` |
| Needs clarification before sprint commitment | `REQ-01`, `REQ-03`, `REQ-06`, `REQ-08`, `REQ-09`, `REQ-13`, `REQ-14` |
| Candidate or deferred | `CAN-01` through `CAN-07`, `CAN-09` through `CAN-11`; `CAN-08` is promoted into `REQ-06` |

The product should not be estimated as one fixed-scope implementation until the `Needs clarification` items that affect the selected first slice have approved rules. The next durable artifacts should be an approved customer lifecycle, authorization model, candidate field catalogue, follow-up policy, privacy rules, and architecture decision record.
