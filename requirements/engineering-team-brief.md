# Engineering Team Brief - Customer Recruitment Portal

## Purpose

This brief gives engineering context for estimating and implementing the customer recruitment portal from handover baseline `HB-2026-08-31`.

The attached requirements and diagrams are not intended as a fixed implementation order. The general architecture direction has already received an initial engineering review. Engineering should now estimate `REQ-01` through `REQ-18`, start ready work, and use conditional ranges plus decision or spike issues where unresolved rules materially affect the implementation.

## What This Project Is

The original idea was a small customer approval portal. Discovery showed a larger need: a lightweight customer-facing recruitment workflow.

The portal should let customer recruiters review candidates supplied by Jobstream, explicitly confirm the transfer of candidate data, obtain an independent copy, contact candidates through simple first-release shortcuts, record what happened, move candidates through a customer-side lifecycle, preview and send a fixed confirmation when the first interview is scheduled, and let Jobstream see follow-up progress.

The smallest useful product is an end-to-end candidate handoff and follow-up path. A frontend-only prototype, a standalone API, or isolated HubSpot changes will not produce value unless they support that full path.

## Recommended Reading Order

| File | Why to read it |
| --- | --- |
| `requirements/engineering-handover-baseline.md` | Handover scope, source hierarchy, estimation rules, and prototype status. |
| `requirements/traceability-matrix.md` | Requirement-to-UX, data, workflow, architecture, and Linear mapping. |
| `requirements/customer-recruitment-portal-requirements.md` | Main product requirements, release slices, business rules, and open decisions. |
| `requirements/customer-recruitment-portal-screen-design-brief.md` | Screen-level behavior for the UX/UI design and prototype. |
| `source-material/Business Application Engineering Standard.docx` | Engineering standard for business objects, lifecycles, timelines, activities, permissions, workflows, notifications, APIs, and events. |
| `diagrams/workspace.dsl` or rendered C4 images | Current architecture direction and system/container boundaries. |
| `diagrams/erd.puml` or rendered portal ERD image | Proposed portal application data model. |
| `diagrams/er-lead-generation.puml` or rendered HubSpot ERD image | Existing/source HubSpot object model. Important: Contact/Candidate is associated to JobVacancy through Lead, not directly. |
| `diagrams/statecharts/CustomerCandidateWorkflow.puml` or rendered image | Draft customer-side candidate lifecycle. |
| `diagrams/statecharts/ContactRevealAndCommercialApproval.puml` or rendered image | Draft transfer confirmation, customer export, retention, and conditional commercial-evidence workflow. |
| `diagrams/statecharts/FollowUpReminderWorkflow.puml` or rendered image | Draft follow-up attention and reminder workflow. |
| `diagrams/statecharts/CandidateInterviewEmailWorkflow.puml` or rendered image | Fixed first-interview email preview, request, failure, and retry workflow. |
| `requirements/decision-brief.md` | Short list of already applied decisions and remaining blockers. |

## Product Scope To Assume For Technical Review

Assume the first useful release must support:

- Assigned user access only. No open self-registration.
- Tenant isolation by customer, with room for department, location, vacancy, or recruiter scope.
- Candidate queue in list and kanban-style views.
- Approved candidate profile and CV access before transfer confirmation, subject to final legal validation.
- Explicit transfer confirmation for all customers before contact data or export is available.
- An immediate, version-bound customer export with retry access to the same package during the 90-day retention period.
- One commercial acknowledgement inside the transfer prompt where a per-candidate contract requires it, committed atomically as distinct evidence with transfer confirmation.
- CV-level transfer evidence and automated deletion or anonymization of post-confirmation candidate content after 90 days.
- Minimal first-release contact support: mailto link, WhatsApp link where possible, and phone number display.
- Activity history that distinguishes shortcut clicks from real user-logged contact outcomes.
- Required notes for manual stage changes and closure.
- Required rejection reason for rejection.
- Customer-side candidate lifecycle with allowed transitions, not direct status updates.
- A read-only preview and explicit combined confirmation for the fixed first-interview email from `no-reply@jobstream.nl`, with the recruiter as `Reply-To`.
- Interview scheduling that remains committed when email sending fails, plus email-only retry and manual-notification guidance.
- Elapsed-time and follow-up attention indicators once the follow-up clock policy is approved.
- Jobstream oversight across authorized customers and scopes.
- Dutch and English product-controlled interface text.
- CV/source-document access where approved, without automatic translation or AI extraction in the first slice.
- Customer administrators inviting and deactivating team members and maintaining vacancy assignments, with controlled last-administrator recovery.
- Attributable team notes, authorized mentions, unread in-product and email mention notifications, and per-user subjective assessments that never affect lifecycle state.
- Metadata-only email-attempt tracking through an opaque single-use CC address, while phone and WhatsApp outcomes remain user-reported.

## Engineering Standard Interpretation

Please review the solution against the Business Application Engineering Standard. The core principle is:

```text
Standardize infrastructure. Configure business behavior.
```

For this project, that means:

- Treat `CustomerCandidate` as the main dynamic object for portal work. It owns lifecycle, timeline, activities, workflow triggers, and notifications.
- Treat entities such as `CustomerTenant`, `PortalUser`, `Role`, `JobVacancy`, `Candidate`, `SourceLead`, and policies as static or supporting objects unless their relationship has business behavior.
- Do not update lifecycle status through generic object updates. Stage changes should go through dedicated transition behavior.
- Record significant events on a timeline: commercial approval recorded, transfer confirmed, customer export prepared or downloaded, retention disposal completed, contact shortcut invoked, user contact outcome logged, stage changed, first-interview email requested/accepted/failed/retried, rejection recorded, reminder sent.
- Model candidate notes, mentions, personal assessments, user invitations, and access changes as attributable domain records rather than unstructured UI state.
- Treat a verified inbound CC receipt as an idempotent metadata-only contact-attempt command. Do not retain message bodies or attachments.
- Use a consistent activity model with standard metadata and flexible payload per activity type.
- Centralize permission evaluation across UI, API, workflows, and integrations.
- Keep notifications as a framework/service concern. Business logic should request notifications, not deliver them directly.
- Persist the interview schedule and an idempotent notification request together; perform provider delivery through the notification worker so a provider failure cannot roll back or duplicate the stage transition.
- Publish meaningful domain events for workflows, notifications, integrations, audit, and reporting.
- Keep HubSpot synchronization separate from portal workflow logic.
- Model transfer confirmation as an idempotent business command, not a generic object update.
- Run 90-day disposal as a configured workflow across the database, file storage, search indexes, and derived copies.

## Expected Interview Email Command Boundaries

| Command | Required behavior |
| --- | --- |
| `PreviewInterviewConfirmation` | Authorize the candidate and transition, validate appointment data, derive candidate language with Dutch fallback, select one approved template version, and return the read-only recipient/sender/reply-address/subject/body preview without changing state. |
| `ScheduleInterviewAndRequestConfirmation` | Revalidate the preview inputs and candidate version, persist the structured interview schedule and at most one idempotent notification request, publish the schedule and request events, and return separate interview-save and email-request statuses. When email prerequisites are missing, save the interview without creating a notification request. |
| `RetryCandidateEmail` | Authorize the candidate, reference the existing failed notification request, create at most one retry attempt for the same schedule/template version, and never repeat the lifecycle transition. |

The authenticated user supplies actor identity; the server derives tenant scope, verified `Reply-To`, candidate language, template version, sender, and idempotency keys. Provider acceptance is an email-attempt result, not proof of candidate delivery or reading.

## Preferred Technical Direction

My current preference is:

| Layer | Preferred option | Reason |
| --- | --- | --- |
| Frontend | Svelte | Lightweight UI, good fit for workflow screens, queue/kanban/detail interactions, and fast iteration. |
| API and backend | FastAPI | Good fit for explicit object APIs, transition endpoints, Pydantic object definitions, and integration services. |
| Data store | PostgreSQL | Good fit for tenant-scoped business data, timelines, activities, audit records, search/indexing, and reporting. |

This preference is not a hard requirement. I do not want the team to accept this stack if it is unfamiliar, poorly supported in the delivery environment, or a worse fit than another option.

If you disagree with Svelte + FastAPI + Postgres, please propose an alternative and explain:

- How it supports the engineering standard.
- How it models dynamic objects, lifecycle transitions, timelines, activities, permissions, workflows, notifications, and audit.
- How it integrates with HubSpot.
- How the team will operate and maintain it.
- What delivery risks it reduces or increases.
- What tradeoffs it creates for speed, quality, security, and long-term maintainability.

## Architecture Questions For Engineering

Please validate or challenge these points before implementation estimates are treated as reliable:

| Topic | Question |
| --- | --- |
| System of record | Which data remains in HubSpot, and which data belongs in the portal application database? |
| HubSpot capability | Can HubSpot support transfer confirmation, version-bound export, 90-day disposal, activity history, authorization, reminders, and reporting without an application data store? |
| Identity and access | Which identity provider and account-provisioning route should be used for assigned customer users? |
| Tenant isolation | How will tenant and work-scope checks be enforced for list views, direct object requests, workflows, and integrations? |
| Dynamic object model | How should `CustomerCandidate` be implemented so state, timeline, activities, and workflows stay consistent? |
| Lifecycle transitions | How will allowed transitions, required notes, and rejection reasons be validated? |
| Activity model | Which activity types and payload schemas are needed for the first release? |
| Collaboration | How will notes, scoped mentions, unread notification state, and assessment revision history remain attributable and authorization-safe? |
| Customer administration | How will invitations, vacancy grants, deactivation, and last-administrator recovery be enforced without rewriting attribution? |
| Contact tracking | Which inbound provider and verification controls will process opaque CC tokens, verified senders, duplicate messages, and content disposal? |
| First-interview email | How will `ScheduleInterviewAndRequestConfirmation` atomically persist the interview schedule and durable email request, while `RetryCandidateEmail` retries only delivery? |
| Email operations | Which provider, sender-domain SPF/DKIM/DMARC configuration, webhook/failure policy, template-version process, and monitoring will support `no-reply@jobstream.nl`? |
| Transfer and privacy | How will confirmation atomically create CV-level evidence, release contact data, make the prepared customer copy available, and start the 90-day period? |
| Export | How will a version-bound package be prepared before confirmation and safely retried without creating a second transfer record? |
| Retention disposal | How will all candidate content, export packages, search-index entries, derived copies, and applicable backups be removed or anonymized after 90 days? |
| Commercial acknowledgement | How should the conditional acknowledgement and its distinct evidence be represented without prematurely implementing billing automation? |
| Follow-up clock | What is needed technically once the business confirms start, pause, reset, stop, and escalation rules? |
| Documents | Should CV/source documents stay in HubSpot, be referenced from the portal, or be copied into platform file storage? |
| Operations | What deployment, monitoring, logging, backup, and incident-response needs are implied by candidate personal data? |

## Requested Engineering Response

Please respond with:

- A short architecture recommendation.
- Whether the preferred Svelte + FastAPI + Postgres stack is acceptable, risky, or should be replaced.
- The main risks, assumptions, and blockers.
- Conditional estimate ranges and confidence for work affected by unresolved decisions.
- Which parts require a technical spike before an estimate can be narrowed.
- A proposed first implementation slice that still delivers an end-to-end candidate follow-up path.
- Any changes needed to the ERD, statecharts, or C4 model.

## Important Open Business Decisions

These do not need to block architectural thinking, but they do affect implementation detail:

- Owner approval for the expanded product direction.
- Exact legal confirmation text and matching updates to the data-transfer agreement and privacy notice.
- Exact profile fields and CV sections approved before transfer confirmation.
- Exact minimized transfer-evidence fields, audience, and retention term after the 90-day candidate-content disposal.
- Commercial handling for per-candidate, incidental, or free candidates.
- Account-provisioning route.
- Final customer lifecycle and transition matrix.
- Rejection reason vocabulary.
- Action-log taxonomy.
- Follow-up clock and reminder policy.
- Approved Dutch and English first-interview template copy, token formatting, and content owner.
- Email delivery provider, sender-domain authentication, operational monitoring, and failure classification.
- Whether HubSpot alone can support the expanded workflow.

## Suggested Delivery Stance

Treat the current documents as the versioned estimation baseline, not as a claim that every business rule is approved.

Start unblocked Slice 1 work while decision tickets and spikes reduce uncertainty. Keep the Git baseline authoritative for requirements and architecture; use Linear for estimates, ownership, dependencies, and delivery status.
