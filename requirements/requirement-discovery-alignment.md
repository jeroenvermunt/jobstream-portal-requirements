# Requirement Discovery Alignment

## Review Basis

- **Interview:** [`meetings/Requirement Discovery/transcript.txt`](../meetings/Requirement%20Discovery/transcript.txt), approximately 53 minutes. It is the latest interview file in the project, but the meeting date is not stated in the recording.
- **Requirements baseline:** [`initial_requirements.md`](../source-material/initial_requirements.md) and [`initial_specifications.md`](../source-material/initial_specifications.md). Neither document contains a version or date.
- **Scope identifiers:** The baseline has no requirement or ticket identifiers, so the matrix uses descriptive scope-item names without inventing IDs.
- **Method:** The transcript was treated as primary evidence. The existing meeting summary was used only for orientation.
- **Source limitation:** The automatic transcript contains errors and no reliable speaker labels. Findings are therefore attributed to an unidentified stakeholder unless the transcript explicitly names someone. Statements from different speakers may represent proposals or disagreement rather than consensus.

## Executive Summary

Overall alignment is low. The baseline defines a secure, HubSpot-based portal where customers see internally qualified candidates and approve or reject them. The interview explicitly rejects approval-only as sufficient for the main customer workflow and instead asks for a lightweight customer-facing ATS: recruiters must contact candidates, move them through customer-side stages, record notes, and expose follow-up activity to Jobstream.

Two baseline principles remain strongly supported: customers need candidate list/detail access, and tenant data must remain isolated. Approval also remains relevant for the less common per-candidate commercial model, but it should not define the entire portal. The assumed HubSpot CMS and serverless architecture is not validated for the expanded scope; stakeholders discuss an application database and possibly a separate platform.

The interview strongly supports adding the customer pipeline, required activity notes, follow-up visibility, age/reminder signals, contact shortcuts, Dutch/English UI, and a simple standardized process. Exact stages, authorization granularity, candidate-detail reveal rules, notification cadence, privacy controls, architecture, integrations, and commercial packaging still require decisions.

## Alignment Matrix

| Scope item | Source evidence and location | Evidence type | Classification | Confidence | Implication |
| --- | --- | --- | --- | --- | --- |
| Candidate list and details | Stakeholders discuss a candidate overview, which details should be visible, and opening a candidate record ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:00:14-00:00:47, lines 6-17). | Direct | Aligned | High | Retain list and detail views, but define field visibility separately. |
| Approve or reject qualified candidates | Approval is questioned as the main action, but remains useful for customers paying per candidate ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:02:25-00:03:25, lines 49-68; 00:08:17-00:09:47, lines 151-183). | Direct | Partially aligned | High | Keep approval as a conditional commercial flow, not the universal workflow. |
| Approval-only MVP | Stakeholders state that approval alone is insufficient and customer recruiters must work candidates through later stages ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:02:40-00:04:16, lines 53-90). | Direct | Contradictory | High | Replace the baseline's approval-only product goal before estimating implementation. |
| Company-level access control | The interview requires each customer's candidates to stay inside its own portal and inaccessible to other customers ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:34:33-00:35:15, lines 663-675). | Direct | Aligned | Preserve strict tenant isolation as a core requirement. |
| Access by department and location | A large customer may have multiple recruiters assigned to their own department and location ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:04:27-00:04:48, lines 91-96). | Direct | Missing from scope | High | Extend authorization beyond company-only access; exact role rules remain open. |
| Candidate statuses in HubSpot | The baseline has internal qualification and approval states. The interview adds customer stages such as supplied, called, intake planned, documents pending, offer, signed, and rejected ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:10:14-00:11:29, lines 191-213). | Direct | Partially aligned | High | Define a separate customer-side lifecycle and map it to the underlying data model. |
| HubSpot CMS module and serverless functions | HubSpot is still considered a practical starting point, but a separate platform and application database are also discussed for ATS behavior and logging ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:06:19-00:07:39, lines 121-142; 00:19:36-00:20:19, lines 362-373). | Direct | Partially aligned | High | Treat the current architecture as a hypothesis, not an approved solution. |
| HubSpot Private Content for secure login | Secure access and two-factor verification are raised, but the discussion defers the detail and does not validate HubSpot Membership ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:05:35-00:06:31, lines 114-125). | Direct | Partially aligned | Medium | Define authentication and security requirements before selecting Private Content. |
| Filtering and matching excluded | The initial review explicitly says filtering and matching are not included, and no later statement makes them part of the first workflow ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:00:42-00:01:20, lines 17-30). | Direct | Aligned | Keep advanced filtering and matching outside the current scope unless customer validation changes this. |
| Document management excluded | Full document management is excluded, but stakeholders expect available CVs to be visible and later discuss structured CV display and photos ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:01:25-00:01:40, lines 33-38; 00:38:22-00:39:27, lines 739-760). | Direct | Partially aligned | High | Distinguish CV/profile presentation from general document management. |
| Status updates with notes | Stakeholders want a required short note when a candidate is rejected, closed, or moved through a stage ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:13:41-00:14:37, lines 253-272). | Direct | Missing from scope | High | Add note capture and traceable status history to the core workflow. |
| Activity and usage logging | Login, contact-button use, follow-up, and candidate activity should be visible to Jobstream ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:12:47-00:14:52, lines 240-275; 00:19:36-00:20:17, lines 362-371). | Direct | Missing from scope | High | Add an auditable activity model; do not equate a shortcut click with successful contact. |
| Follow-up age and reminders | Stakeholders ask for reminders after inactivity, visibility of how long a candidate has waited, and contact within 24 to 48 hours ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:12:06-00:12:25, lines 226-228; 00:24:43-00:27:27, lines 460-520). | Direct | Missing from scope | High | Add elapsed-time indicators and a follow-up policy; notification cadence needs refinement. |
| Phone, email, and WhatsApp shortcuts | Stakeholders request shortcuts that open the relevant contact channel, while acknowledging that this does not prove communication occurred ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:17:28-00:20:00, lines 327-367). | Direct | Missing from scope | High | Add contact shortcuts and log invocation separately from verified contact activity. |
| Aggregate operational visibility | Jobstream wants to review follow-up across recruiters, departments, and locations and see whether candidates were handled ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:04:27-00:04:48, lines 91-96; 00:15:33-00:17:28, lines 294-326). | Direct | Missing from scope | High | Add operational reporting, but validate which metrics and comparisons are appropriate. |
| Dutch and English UI | The interface and system messages should switch between Dutch and English; source CVs may remain in their original language ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:37:27-00:38:30, lines 726-741). | Direct | Missing from scope | High | Add UI localization; do not imply automatic translation of candidate documents. |
| Guided, standardized workflow | Stakeholders prefer a simple fixed process with onboarding guidance rather than customer-specific configuration ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:28:41-00:31:10, lines 540-595). | Direct | Missing from scope | High | Add usability and process-standardization constraints. |
| Candidate detail reveal | Stakeholders propose initially obscuring identity/contact fields, revealing them once on action, and logging that action ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:39:31-00:40:46, lines 761-779). | Direct | Missing from scope | Medium | Treat reveal behavior as a proposal pending commercial, privacy, and fairness review. |
| External ATS imports and synchronization | Importing customer candidates and integrating existing ATS products is discussed as a new service, custom work, or a plan for later ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:31:13-00:36:12, lines 597-703). | Direct | Out of scope | High | Defer from the first release while preserving an integration boundary. |
| AI help or customer chat | A contextual assistant is proposed, but its behavior and the existing IPster agreement are unclear ([transcript](../meetings/Requirement%20Discovery/transcript.txt), 00:21:36-00:24:42, lines 399-459). | Direct | Missing from scope | Medium | Do not commit it until ownership, capabilities, data access, and value are validated. |

The campaign-closure automation in the baseline was not discussed in the interview. The interview's silence neither validates nor rejects that existing rule.

## Confirmed Findings

- **The product goal must expand beyond approval.** The primary customer workflow is a lightweight ATS in which customer recruiters continue candidate follow-up after Jobstream handoff.
- **The customer needs a visible pipeline.** Recruiters must see candidates by stage and update their progression; a simple click-based transition is acceptable before drag-and-drop behavior.
- **Follow-up must be traceable.** Status changes, rejection, and closing actions need short notes and a history visible to Jobstream.
- **Timely handling is a business outcome.** Candidate age and whether follow-up occurred within roughly 24 to 48 hours must be observable, while exact reminder timing remains open.
- **Tenant isolation remains mandatory.** Company access is supported directly, with department/location authorization added as a new need.
- **The product should minimize configuration.** Stakeholders want a prescribed Jobstream process that a junior recruiter can use with limited training.
- **The interface must support Dutch and English.** Uploaded or source documents may remain in their original language.

## Contradictions And Gaps

- **Core scope conflict:** The baseline's approval-only MVP does not support the workflow stakeholders describe for most customers. Estimating it as written would produce the wrong product.
- **Lifecycle gap:** Existing status assumptions stop at customer approval or rejection and do not model customer contact, intake, document collection, offer, hire, or customer-side rejection.
- **Data and architecture gap:** The proposed CMS/serverless solution does not account for detailed activity history, usage analytics, reminders, or the possible need for an application database.
- **Authorization gap:** Company-only access is too coarse for customers with recruiter, department, location, or vacancy-specific responsibilities.
- **Evidence gap:** The transcript does not establish exact stages, transition permissions, rejection reasons, note requirements per action, notification rules, or role definitions.
- **Privacy and accountability gap:** Identity reveal, click tracking, notes, CVs, photos, retention, and cross-customer performance comparisons require explicit policy and data-governance decisions.
- **Security gap:** The baseline selects HubSpot Private Content, while the interview only raises secure login and two-factor verification without accepting a mechanism.

## New Requirement Signals

| Signal | Affected actor or workflow | Evidence | Validation still needed |
| --- | --- | --- | --- |
| Customer-side candidate pipeline | Customer recruiter | Stages and progression at 00:10:14-00:11:29, lines 191-213. | Final stage names, transitions, permissions, terminal states, and reopening rules. |
| Mandatory notes and activity history | Customer recruiter; Jobstream operations | Required notes at 00:13:41-00:14:37, lines 253-272. | Which actions require notes, minimum content, editability, and retention. |
| Follow-up service level | Customer recruiter; Jobstream operations | 24-48 hour expectation at 00:26:17-00:27:27, lines 500-520. | SLA start/stop events, working hours, escalation, and exceptions. |
| Scoped recruiter access | Customer admin; recruiter | Department/location scenario at 00:04:27-00:04:48, lines 91-96. | Role model, assignment source, admin functions, and cross-location visibility. |
| Contact shortcuts | Customer recruiter | Shortcut behavior at 00:18:18-00:20:00, lines 344-367. | Supported devices/channels, templates, consent, and distinction between click and completed contact. |
| Candidate reveal event | Customer recruiter; commercial operations | One-time reveal proposal at 00:39:31-00:40:46, lines 761-779. | Fields hidden, commercial trigger, authorization, audit purpose, and fairness/privacy review. |
| Operational reporting | Jobstream operations; customer management | Follow-up and performance visibility at 00:15:33-00:17:28, lines 294-326. | Approved KPIs, access, aggregation thresholds, and fair-use policy. |
| Onboarding and contextual guidance | New customer recruiter | Guided onboarding at 00:24:43-00:31:10, lines 460-595. | First-release content, owner, delivery format, and success measure. |
| Structured CV/profile and photo | Customer recruiter; candidate | CV extraction/photo ideas at 00:38:22-00:39:27, lines 739-760. | Necessity, source quality, consent, bias risk, storage, and deletion. |
| AI support assistant | Customer recruiter; Jobstream support | Repeated-question assistant at 00:21:36-00:24:42, lines 399-459. | IPster contract, implementation owner, approved knowledge, guardrails, and escalation. |

## Open Questions

1. **Product owner:** Is the first release a lightweight customer ATS for all customers, with approval enabled only for per-candidate contracts?
2. **Recruitment operations:** What are the exact customer-side stages, allowed transitions, rejection reasons, and mandatory note rules?
3. **Product owner and customer administrators:** Which roles can view or update candidates across companies, departments, locations, vacancies, and recruiter assignments?
4. **Solution architect:** Can HubSpot support the required activity history, authorization, reminders, and reporting, or is a separate application database required?
5. **Security owner:** What authentication assurance is required, including two-factor authentication, session controls, and account administration?
6. **Privacy owner:** Which candidate fields may be shown, obscured, or revealed, and how long may identity, CV, photo, notes, and activity events be retained?
7. **Recruitment operations:** When does the follow-up clock start, which events stop it, and which reminders or escalations should occur without notification fatigue?
8. **Commercial owner:** Which contracts require an explicit candidate approval/reveal action, and does that action create a billable event?
9. **Operations and analytics owner:** Which KPIs may be shown to customers or compared across recruiters/customers, and under what aggregation rules?
10. **Integration owner:** What does the IPster agreement cover for chat, WhatsApp, and calling, and who is responsible for implementation?

## Recommended Next Steps

### Add Now

- Replace the approval-only product goal with a customer-side recruitment workflow covering candidate visibility, stage progression, rejection/closure, and traceable notes.
- Add strict tenant authorization with company isolation and support for assigned department, location, vacancy, or recruiter scope.
- Add activity events for login, candidate reveal, contact-shortcut invocation, status changes, and notes. Define these as observed system actions, not proof that contact occurred.
- Add candidate age and timely-follow-up visibility, anchored to the stated 24-48 hour operational expectation.
- Add Dutch and English interface localization while leaving source documents untranslated.
- Add a usability constraint that the workflow is standardized, low-configuration, and understandable with limited onboarding.

### Refine Later

- Specify the exact pipeline, transition rules, rejection reasons, mandatory-note matrix, and reopen behavior.
- Decide reminder channels, cadence, escalation, configurability, and notification-fatigue controls.
- Define candidate field visibility, one-time reveal behavior, CV/profile presentation, photos, consent, audit, and retention.
- Define reporting metrics and governance before implementing individual or cross-customer performance comparisons.
- Run an architecture decision record comparing HubSpot-only, HubSpot plus an application database, and a separate portal.
- Validate the proposed flow with the planned three customer demos before committing sprint scope.

### Defer

- Defer importing external candidates and synchronizing third-party ATS products to a later integration workstream.
- Defer full inbox, WhatsApp, or calling integration; first-release contact shortcuts can open external tools without claiming verified communication.
- Defer the AI support assistant until the IPster capabilities and implementation responsibilities are documented.
- Defer drag-and-drop pipeline controls; click-based stage changes were accepted as a simpler starting point.
- Defer billing automation and detailed subscription packaging until the product and commercial model are agreed.
