# Review Session 1 User-Story Analysis

## Document Status

| Field | Value |
| --- | --- |
| Status | Product decisions recorded 2026-08-27; source analysis retained for traceability |
| Review session | Review Sessions, session 1 |
| Primary evidence | [`transcript.md`](../meetings/Review%20Sessions/session%201/transcript.md) |
| Comparison baseline | [`customer-recruitment-portal-requirements.md`](customer-recruitment-portal-requirements.md) |
| Evidence date | Not stated in the transcript |

The requested `transcript.txt` was not present. This analysis uses the available `transcript.md` in the same session folder. The `RS1-US-*` identifiers are local to this analysis and are not approved requirement or backlog identifiers.

Bob Kloppenburg's review comments are treated as domain-expert evidence. Statements made by Jobstream participants after Bob left are recorded separately as internal product signals. Neither category is treated as automatic scope approval.

## Product Decision Outcome

The product refinement on 2026-08-27 approved the following release decisions. These decisions are later product-owner input and are not attributed to the transcript.

| Item | Decision |
| --- | --- |
| `RS1-US-01` | First release: task-first mobile support for the complete core journey on supported modern phone browsers from 360 CSS pixels. |
| `RS1-US-02` | First release: customer administrators invite and deactivate users and maintain vacancy assignments; Jobstream handles last-administrator recovery. |
| `RS1-US-03` | First release: assigned hiring managers may complete the full candidate workflow within assigned vacancies. |
| `RS1-US-04` | First release: a valid five-phase Kanban drop opens the canonical detailed transition flow; click progression remains available. |
| `RS1-US-05A` | First release: attributable notes, authorized mentions, and in-product notifications. |
| `RS1-US-05B` | First release: per-user negative, positive, and strong-positive assessments with revision history and no workflow effect. |
| `RS1-US-06` | Deferred: preserve one standardized Jobstream presentation. |
| `RS1-US-07` | Deferred in full: do not turn prototype feedback tooling into a customer feature. |

The same refinement separately amended contact tracking: mailto shortcuts receive an opaque, single-invocation CC address; verified received copies create metadata-only email-attempt evidence; phone and WhatsApp shortcuts open contact logging with channel and time selected but no outcome assumed.

## Executive Summary

The review strongly supports the current direction: a simple customer recruitment workflow, limited configuration, visible follow-up age, an attributable activity history, Dutch and English support, and standardized stages. The expert considered the prototype understandable and usable without extensive onboarding.

The clearest new requirement is end-to-end mobile web support. The expert described reviewing new candidates, opening CVs, calling, emailing, and using WhatsApp from a phone, including while away from a desk. This is not covered by the current requirements, which explicitly identify device support as unvalidated.

The session also introduces potential stories for customer-managed users, scoped hiring-manager access, drag-and-drop Kanban progression, internal candidate feedback and mentions, limited customer branding, and in-product help or suggestions. These signals are relevant, but most need role, authorization, notification, or workflow rules before sprint commitment.

The largest requirement conflict concerns the pipeline. The expert endorsed five standardized visible phases and no customer-defined workflow, while `REQ-06` currently proposes ten lifecycle states. This may be resolvable by distinguishing a five-column presentation model from more detailed underlying states, but the transcript does not make that decision.

## Alignment With Current Requirements

| Current item | Evidence | Classification | Confidence | Recommended action |
| --- | --- | --- | --- | --- |
| `REQ-01` tenant and work-scope access | The expert proposes multiple customer users, a head user who adds hiring managers, and vacancy-specific access (38:00-39:10). | Partially aligned | High | Extend refinement to customer-managed invitations, deactivation, succession, and scoped roles. |
| `REQ-05` contact shortcuts | The expert wants email, WhatsApp, and phone actions to open directly and shortcut use to be recorded (21:08-23:24). | Aligned | High | Preserve shortcut-based first-release behavior and attributable invocation events. |
| `REQ-06` customer pipeline | The expert uses drag-and-drop heavily and endorses five standardized phases rather than configurable workflows (19:21-20:26, 44:11-45:16). | Partially aligned | High | Revisit `CAN-08` and reconcile five visible phases with the proposed ten-state lifecycle. |
| `REQ-07` notes and activity | The expert values an activity log naming the user and proposes notes, quick feedback, and colleague mentions (21:59-23:28, 42:39-43:22). | Partially aligned | High | Keep attributable history; refine collaborative feedback and mention behavior separately. |
| `REQ-08` follow-up age | The expert demonstrates a day count on each candidate and uses it to identify stalled work (40:31-42:39). | Aligned | High | Retain visible elapsed-time signals; do not infer a new threshold policy. |
| `REQ-10` oversight | The expert asks to see hires in the dashboard and values data showing what happened and how many people were hired (26:43-27:34, 30:16-30:49). | Aligned | High | Retain hired/signed outcome reporting within authorized scope. |
| `REQ-11` Dutch and English | The expert explicitly recommends Dutch and English (46:21-46:30). | Aligned | High | No new story required. |
| `REQ-12` standardized workflow | The expert repeatedly favors a basic, self-explanatory product and fixed phases (12:57-13:06, 44:01-45:41). | Aligned | High | Preserve standardization and avoid customer-defined workflows in the initial product. |
| `REQ-13` security and retention | The expert recommends additional login protection and asks about retention (12:23-12:51, 28:35-29:46). | Partially aligned | Medium | Keep authentication assurance open; retain the later legally reviewed 90-day policy. |
| `CAN-03`, `CAN-07`, `CAN-09` | External sources, customer-originated candidates, Jobstream filtering services, and packaging are explored (32:01-35:52, 50:33-53:55). | Out of current scope | High | Keep as strategic product and commercial discovery, not approved portal stories. |

## Proposed User Stories

### RS1-US-01: Complete Candidate Follow-Up On Mobile Web

| Attribute | Value |
| --- | --- |
| Status | Ready for design and backlog refinement |
| Classification | Earning |
| Actor | Customer recruiter |
| Journey position | Across candidate review and follow-up |

**Outcome:** Recruiters can act on new candidates while away from a desktop, reducing delays caused by location or device.

**Story:** As a customer recruiter, I want to review and progress supplied candidates from my phone, so that I can continue timely follow-up when I am not at my desk.

**In scope**

- Responsive mobile web access to the authorized candidate queue.
- Opening candidate details and available CV information.
- Starting supported email, WhatsApp, and phone actions using device capabilities.
- Recording contact outcomes, notes, and stage changes required by the core workflow.
- The same authorization, transfer-confirmation, validation, and audit rules as desktop.

**Out of scope**

- A native iOS or Android application.
- Mobile-only business behavior or reduced security controls.
- New communication integrations beyond the shortcuts in `REQ-05`.

**Business rules**

1. Mobile access must not expose less or more candidate data than the same user's desktop access.
2. A device handoff to phone, email, or WhatsApp records only the action the portal can observe.
3. Core follow-up must remain usable without requiring a desktop-only completion step.

**Representative example**

```text
Given an authorized recruiter receives a new candidate while away from a desk
When the recruiter opens the portal on a supported mobile browser
Then the recruiter can review the candidate and available CV information
And can initiate a supported contact action
And can record the resulting outcome under the same workflow rules as desktop
```

**Dependencies and open decisions:** Responsive UX, supported browser and viewport policy, CV presentation on small screens, accessibility validation, and device behavior for contact links.

**Evidence:** Bob describes checking new candidates, CVs, WhatsApp, email, and calls on his phone and recommends mobile-friendly launch behavior (23:45-26:13). Jeroen recognizes that the full interface needs a mobile-specific presentation (23:51-25:28).

### RS1-US-02: Manage Customer Organization Users

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning with enabling security work |
| Actor | Customer account administrator |
| Journey position | Administer access |

**Outcome:** Customers can keep portal access operational without asking Jobstream to perform every routine user change.

**Story:** As a customer account administrator, I want to invite and deactivate colleagues, so that authorized recruitment work can continue when responsibilities change.

**In scope proposed for validation**

- Inviting an existing colleague as a customer user.
- Deactivating access when a colleague leaves or no longer needs the portal.
- Showing who currently has access to the customer workspace.
- Preserving activity attribution after a user is deactivated.

**Out of scope**

- Public self-registration.
- Cross-customer administration.
- Customer control over Jobstream operational roles.

**Business rules requiring confirmation**

1. Only an approved customer administrator may manage customer users.
2. Invitations must not grant access until the recipient completes the approved authentication flow.
3. Deactivation must prevent new access without removing historical activity attribution.
4. At least one controlled recovery or ownership-transfer route is required when the administrator leaves.

**Representative example**

```text
Confirmation required:
Given Eva is the authorized administrator for Customer A
When Eva invites a hiring manager for Customer A
Then the invitation cannot grant access to another customer
And the invited user receives only the scope assigned through the approved role model
```

**Dependencies and open decisions:** Administrator appointment, invitation and recovery flows, maximum user policy, authentication assurance, audit requirements, and whether Jobstream approval is required for each invitation.

**Evidence:** Bob proposes two or three users, including hiring managers, and later recommends that the head user add colleagues directly so Jobstream does not perform every change (36:04-36:35, 37:35-39:10). The specific user limit is illustrative, not an approved rule.

### RS1-US-03: Collaborate Within Assigned Hiring Scope

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actor | Hiring manager or customer recruiter |
| Journey position | Review, contact, and progress candidates |

**Outcome:** Customer colleagues can share recruitment work without receiving unnecessary access to every vacancy or candidate.

**Story:** As a hiring manager, I want to work with candidates for my assigned vacancies, so that I can participate directly without relying on one HR colleague for every action.

**In scope proposed for validation**

- Assignment to one or more authorized vacancies or organizational scopes.
- Candidate visibility and actions limited to that assignment.
- Activity attribution to the colleague who performed the action.
- Continuity when the primary HR user is unavailable.

**Out of scope**

- An unrestricted shared customer login.
- Employee-performance ranking.
- A final role matrix invented from this review alone.

**Business rules requiring confirmation**

1. Candidate visibility must follow the intersection of tenant access and assigned work scope.
2. Every action must identify the acting user rather than only the customer organization.
3. Assignment changes must not rewrite historical attribution.

**Representative example**

```text
Confirmation required:
Given a hiring manager is assigned only to the Operations vacancy
When the hiring manager opens the candidate queue
Then candidates for Operations are available
And candidates available only to Finance are not disclosed
```

**Dependencies and open decisions:** Role vocabulary, view-versus-edit permissions, assignment granularity, administrator story `RS1-US-02`, and the authorization model in `REQ-01`.

**Evidence:** Bob describes HR teams in which different colleagues contact candidates, hiring managers need direct access, and managers may be limited to operational or finance vacancies (23:24-23:45, 36:09-36:35, 37:47-39:10).

### RS1-US-04: Progress Candidates By Dragging Kanban Cards

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actor | Customer recruiter |
| Journey position | Record and progress |

**Outcome:** Recruiters handling several vacancies or candidates can update progress quickly while keeping the standardized workflow reliable.

**Story:** As a customer recruiter using the Kanban view, I want to drag a candidate to the intended stage, so that I can progress work quickly without opening each profile first.

**In scope proposed for validation**

- Moving an authorized candidate card between permitted visible stages.
- Requesting required notes, outcomes, interview details, or confirmation before completing a transition.
- Writing the same stage and activity events as the existing click-based flow.
- Retaining a non-drag alternative for accessibility and devices where dragging is unsuitable.

**Out of scope**

- Customer-defined stages or workflow configuration.
- Bypassing transition, note, interview-email, or rejection rules.
- Treating visual movement as complete before required information is accepted.

**Business rules**

1. Dragging is an alternative interaction for an approved transition, not a separate state model.
2. Invalid or unauthorized destinations must not change the candidate state.
3. A transition requiring more information completes only after that information is supplied.
4. Click-based progression remains available.

**Representative example**

```text
Given an authorized recruiter views a contacted candidate in the Kanban view
When the recruiter drags the candidate to the first-interview phase
Then the portal requests the required interview details
And changes the stage only after the applicable rules are satisfied
And records the same attributable history as the click-based action
```

**Dependencies and open decisions:** Approved lifecycle and transitions, reconciliation of five visible phases with detailed states, touch and keyboard interactions, and the requirements in `REQ-06`, `REQ-07`, and `REQ-15`.

**Evidence:** Bob says he uses dragging extensively and finds Kanban preferable for candidate work, especially at larger vacancy volumes (19:21-20:26, 26:13-26:43). Jeroen later identifies drag-and-drop as something to add (46:36-46:53). This is stronger evidence than the earlier basis for deferring `CAN-08`, but it does not resolve transition rules.

### RS1-US-05: Share Attributable Candidate Feedback

| Attribute | Value |
| --- | --- |
| Status | Needs clarification |
| Classification | Earning |
| Actor | Customer recruiter or hiring manager |
| Journey position | Review and collaborate |

**Outcome:** Colleagues can coordinate candidate decisions in the portal instead of losing context in separate messages.

**Story:** As a customer recruitment team member, I want to leave concise feedback for an authorized colleague, so that the next action and its reasoning remain visible with the candidate.

**In scope proposed for validation**

- A candidate note attributed to its author and time.
- An optional structured positive or negative assessment if recruitment operations defines its meaning.
- Mentioning another authorized customer user in a note.
- Showing the resulting collaboration event in the candidate history.

**Out of scope**

- Exposing feedback to unauthorized users or candidates by default.
- Treating a quick assessment as a stage change or rejection reason.
- Selecting email or in-product mention notifications without a notification policy.

**Business rules requiring confirmation**

1. Only users who may access the candidate may view or be mentioned in candidate feedback.
2. Feedback must identify its author and must follow approved correction and retention rules.
3. A positive or negative marker has no workflow effect unless an explicit rule is approved.

**Representative example**

```text
Confirmation required:
Given Bob and Angel may both access the candidate
When Bob records a note mentioning Angel
Then the note appears in the attributable candidate history
And Angel receives only the notification allowed by the approved policy
```

**Dependencies and open decisions:** Relationship with required notes in `REQ-07`, feedback vocabulary, mention-notification channel, edit/correction behavior, retention, and employee-monitoring review.

**Evidence:** Bob demonstrates quick positive/negative candidate feedback, a note directing a colleague to invite the candidate, and an `@`-style mention (42:39-43:22). Notification behavior is discussed only as a possibility dependent on email integration.

### RS1-US-06: Apply Limited Customer Workspace Branding

| Attribute | Value |
| --- | --- |
| Status | Candidate or deferred |
| Classification | Earning |
| Actor | Customer account administrator |
| Journey position | Configure workspace presentation |

**Outcome:** Customer users can recognize the portal as their working environment without introducing bespoke product configuration.

**Story:** As a customer account administrator, I want approved company branding in the workspace, so that colleagues recognize the environment they are using.

**Candidate scope**

- Customer logo and a constrained primary-color choice.
- Product-controlled contrast and accessibility safeguards.
- Jobstream identity and legal context remaining visible where required.

**Out of scope**

- Fully custom themes, layouts, fields, or workflows.
- Customer-authored candidate email branding under `REQ-15`.
- Bespoke development per customer.

**Representative example**

```text
Confirmation required:
Given an authorized customer administrator selects an approved company color
When customer users next open the workspace
Then the approved brand treatment is visible
And text and controls retain the required accessibility contrast
```

**Dependencies and open decisions:** Product-brand strategy, allowed controls, asset validation, accessibility, multi-brand behavior, and administrative permissions.

**Evidence:** Bob asks for company colors and later proposes adding a logo through settings (12:03-12:23, 36:04-36:35). The review provides preference evidence but no demonstrated workflow problem or priority.

### RS1-US-07: Get Contextual Help And Submit Suggestions

| Attribute | Value |
| --- | --- |
| Status | Candidate or deferred |
| Classification | Learning and Earning |
| Actor | New or occasional customer recruiter |
| Journey position | Learn and improve the process |

**Outcome:** Users can recover when uncertain and provide improvement signals without making formal onboarding a prerequisite.

**Story:** As a portal user, I want concise help and a simple way to submit a suggestion in context, so that I can continue working and report friction when the standardized process is unclear.

**Candidate scope**

- Contextual help explaining the current stage or action.
- A simple suggestion submission associated with the current screen or workflow context.
- Confirmation that a suggestion was recorded without promising implementation.

**Out of scope**

- Customer-specific training programmes.
- An AI support assistant.
- Public roadmap commitments or automatic creation of untriaged development work.

**Business rules requiring confirmation**

1. Help content must match the standardized workflow in `REQ-12`.
2. Suggestion submission must explain how user and screen context are handled.
3. Submitting a suggestion must not interrupt or alter candidate workflow state.

**Representative example**

```text
Given a recruiter is unsure what the current stage requires
When the recruiter opens contextual help
Then the approved next-action guidance is available without leaving the workflow
And any submitted suggestion is acknowledged separately from candidate activity
```

**Dependencies and open decisions:** Content ownership, feedback recipients and triage, privacy, retention, notification expectations, and whether existing prototype review tooling is appropriate for production.

**Evidence:** Bob says the product should be understandable with little or no tutorial content but recognizes help buttons (45:16-46:30). Sonnie proposes tutorial content and an in-product ideas box routed to development (45:41-46:20). This is mixed evidence: contextual recovery is supported, while the amount of training and the feedback operating model remain unresolved.

## Internal Product Signals

The discussion after Bob leaves is useful for strategy but does not validate customer behavior:

- Jobstream considers making portal access conditional on purchasing or committing to Jobstream recruitment and selection services (50:33-53:55). This is a commercial entitlement decision, not a user story yet.
- Customer-originated candidate intake would require a source, import, or integration model that the current HubSpot-dependent flow does not provide (51:43-53:34). Keep this with `CAN-03` and `CAN-07`.
- Campaigns and selection are described as the current core business, while broader ATS use remains a possible expansion (53:35-53:55). This supports preserving the current service-led product boundary.

## Split Decisions

| Considered split | Decision | Rationale |
| --- | --- | --- |
| Native application versus responsive web | Select responsive mobile web first | It supports the demonstrated mobile journey without creating separate iOS and Android products. |
| User administration and scoped collaboration as one story | Split | Inviting or removing users is an administrative outcome; working assigned vacancies is a recruitment outcome with separate authorization rules. |
| Drag-and-drop as a new workflow | Reject | It must remain an alternative interaction over the canonical lifecycle and validations. |
| Notes, quick assessment, and mentions as separate stories | Keep as one candidate collaboration story for refinement | The review presents them as one coordination behavior; notification and assessment semantics must be clarified before further slicing. |
| Help and product feedback as mandatory first-release scope | Defer pending operating model | Existing standardized guidance remains required, but the review does not establish content ownership or feedback triage. |

## Open Decisions

| Decision | Why it matters | Best stakeholder role |
| --- | --- | --- |
| Which mobile browsers, viewport sizes, and core tasks are release requirements? | `RS1-US-01` cannot be verified consistently without a support policy. | Product owner and UX lead |
| Who may become a customer administrator, and how is administration recovered or transferred? | It controls whether customer-managed access is safe and supportable. | Product and security owners |
| Which roles may view, contact, progress, or only comment on candidates? | User administration cannot be implemented safely without a role model. | Recruitment operations and security owners |
| Are access assignments made by vacancy, department, location, recruiter, or a defined combination? | The choice determines authorization and administration complexity. | Product owner |
| Are five visible Kanban phases a presentation over detailed lifecycle states, or the canonical lifecycle itself? | This resolves the conflict between the review and `REQ-06`. | Recruitment operations lead |
| Which transitions may be initiated by drag-and-drop, including backward movement and reopening? | Dragging must not bypass required information or create invalid states. | Recruitment operations lead |
| What does positive or negative candidate feedback mean, and does it affect decisions? | An undefined marker can be misleading or duplicate rejection behavior. | Recruitment operations and privacy owners |
| Should mentions notify in-product, by email, or not at all initially? | The channel affects integration, privacy, and notification fatigue. | Product owner and customer representatives |
| Is customer branding worth introducing configuration into an intentionally standardized product? | Branding could improve familiarity but weaken the simplicity principle. | Product and brand owners |
| Who receives, triages, retains, and responds to in-product suggestions? | A feedback control without an operating process creates an unmanaged queue and false expectations. | Product owner |

## Backlog Recommendations

| Action | Item | Rationale |
| --- | --- | --- |
| Add now | `RS1-US-01` through `RS1-US-04` | Mobile, controlled customer administration, vacancy-scoped workflow access, and validated Kanban dragging are approved first-release behavior. |
| Split and add now | `RS1-US-05A`, `RS1-US-05B` | Notes/mentions and subjective assessment are separate collaboration behaviors with approved semantics. |
| Defer | `RS1-US-06`, `RS1-US-07` | Branding and product-feedback facilities are useful candidates but are not necessary to complete the core recruitment outcome. |
| Amend existing | `REQ-01`, `REQ-06`, `REQ-07`, `REQ-12` | The review adds material detail about user administration, visible phases, collaboration, and low-training adoption. |
| Confirm existing | `REQ-05`, `REQ-08`, `REQ-10`, `REQ-11` | The expert directly supports their intended behavior. |
| Keep open | `REQ-13` authentication assurance | Additional protection is recommended, but no mechanism or risk policy is approved. |
| Keep deferred | `CAN-03`, `CAN-07`, `CAN-09` | Imports, broader candidate sources, and commercial packaging remain separate strategic workstreams. |

## Readiness Summary

| Readiness | Items |
| --- | --- |
| Ready for design and backlog refinement | `RS1-US-01`, `RS1-US-02`, `RS1-US-03`, `RS1-US-04`, `RS1-US-05A`, `RS1-US-05B` |
| Candidate or deferred | `RS1-US-06`, `RS1-US-07` |

The remaining refinement should validate these approved behaviors with representative users and complete production security, privacy, and architecture decisions without expanding into a configurable ATS.
