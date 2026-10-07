# Klantenportaal Jobstream

This repository captures the discovery, requirements, and architecture for Jobstream's customer-facing recruitment portal.

Published requirements repository: [jeroenvermunt/jobstream-portal-requirements](https://github.com/jeroenvermunt/jobstream-portal-requirements). The immutable engineering handover is tagged [`handover-HB-2026-08-31`](https://github.com/jeroenvermunt/jobstream-portal-requirements/tree/handover-HB-2026-08-31).

## Project Context

**Goal:** Deliver a secure, easy-to-use portal where customer recruiters can work with candidates supplied by Jobstream, progress them through a customer-side recruitment pipeline, and record what follow-up occurred.

**Current phase:** Engineering handover, estimation, and implementation start.
Requirements `REQ-01` through `REQ-18` form baseline `HB-2026-08-31`. The
clickable prototype is a behavioral reference rather than production code.
Ready Slice 1 work may start while explicit decision and spike issues narrow
conditional estimates for unresolved product, privacy, and integration rules.

**Stakeholders:** Jobstream business stakeholders and recruiters define the operating model. Jeroen is responsible for translating discovery into requirements and UX concepts before requesting implementation estimates. Other ownership and decision authority still need confirmation.

**Success criteria:**

- Customer users can access only candidates and vacancies belonging to their authorized company scope.
- Customer recruiters can see relevant candidate details, progress candidates through agreed stages, and leave traceable notes.
- Jobstream can see whether candidates are followed up and how quickly that happens.
- The workflow remains simple enough for customer recruiters to use with limited training.
- Candidate data and user actions are handled in a way that supports privacy and accountability obligations.

**Constraints:**

- HubSpot is the current CRM and system of record; whether HubSpot alone can support the expanded ATS workflow is unresolved.
- The portal must support company-level data isolation and may later require department or location-level authorization.
- Dutch and English interface text is required, while user-provided documents may remain in their original language.
- The visual identity is not final because the Jobstream brand book is still in progress.
- Existing diagrams and the initial specification reflect the earlier approval-focused scope and may require revision.

## Domain Terms

| Term | Meaning |
| --- | --- |
| Customer portal | Authenticated interface where customer recruiters work with candidates supplied by Jobstream. |
| ATS | Applicant tracking workflow used to progress candidates, record activity, and monitor follow-up. |
| Candidate | Person sourced through a recruitment campaign and represented in HubSpot. |
| Qualified candidate | Candidate screened by Jobstream and ready for customer follow-up. |
| Job vacancy | HubSpot object representing the recruitment request and campaign lifecycle. |
| Customer approval | Earlier scope in which a customer only approved or rejected a qualified candidate. |
| Customer pipeline | Expanded workflow in which customer recruiters contact and progress candidates after Jobstream handoff. |

## Sources Of Truth

| Path | Purpose | Status |
| --- | --- | --- |
| [`requirements/engineering-handover-baseline.md`](requirements/engineering-handover-baseline.md) | Versioned handover scope, source hierarchy, reconciliation outcome, and estimation rules. | Current engineering entrypoint. |
| [`requirements/traceability-matrix.md`](requirements/traceability-matrix.md) | Mapping from `REQ-01` through `REQ-18` to UX, data concepts, workflows, architecture, and Linear outcomes. | Current handover baseline. |
| [`requirements/linear-backlog-catalog.md`](requirements/linear-backlog-catalog.md) | Planned Linear outcome, enabling, decision, and spike issue catalog. | Source for Linear creation and backlog checks. |
| [`requirements/linear-handover-result.md`](requirements/linear-handover-result.md) | Created Linear project, document, milestone, outcome, enabler, and decision identifiers. | Current execution mapping. |
| [`meetings/Requirement Discovery/transcript.txt`](meetings/Requirement%20Discovery/transcript.txt) | Raw evidence from the latest requirements discovery discussion. | Current raw source; noisy transcript requiring interpretation. |
| [`meetings/Requirement Discovery/summary.md`](meetings/Requirement%20Discovery/summary.md) | Structured decisions, requirements, actions, and unresolved questions from the transcript. | Derived summary; validate with stakeholders. |
| [`requirements/customer-recruitment-portal-requirements.md`](requirements/customer-recruitment-portal-requirements.md) | Expanded, traceable product requirements derived from discovery and accepted prototype decisions. | Engineering handover baseline; blocked rules remain explicit. |
| [`requirements/customer-recruitment-portal-screen-design-brief.md`](requirements/customer-recruitment-portal-screen-design-brief.md) | UX/UI handoff translating requirements into screens, flows, states, and design decisions. | Designer handoff draft; validate through prototype review. |
| [`requirements/engineering-team-brief.md`](requirements/engineering-team-brief.md) | Engineering handoff brief summarizing context, standards, preferred stack, estimate expectations, and implementation risks. | Current handover brief. |
| [`requirements/engineering-estimate-update-first-interview-email.md`](requirements/engineering-estimate-update-first-interview-email.md) | Short change brief requesting a delta and revised estimate for the first-interview email story. | Current estimate-update handoff. |
| [`requirements/decision-brief.md`](requirements/decision-brief.md) | Short decision brief extracted from the answered review template. | Current working review artifact for remaining blocker decisions. |
| [`requirements/review-feedback.md`](requirements/review-feedback.md) | Focused place to confirm decisions, answer blockers, and leave requirement feedback. | Working feedback document. |
| [`requirements/open-questions-response-template.md`](requirements/open-questions-response-template.md) | Detailed review template for resolving open decisions and recording additional evidence-backed notes. | Raw review input; use the decision brief for the next review pass. |
| [`requirements/requirement-discovery-alignment.md`](requirements/requirement-discovery-alignment.md) | Comparison of the discovery evidence with the original approval-portal scope. | Current alignment analysis. |
| [`frontend/ux-specification.md`](frontend/ux-specification.md) | User goals, journey rules, required information, states, and UX success criteria. | Current UX source for the prototype. |
| [`frontend/wireframe.json`](frontend/wireframe.json) | Semantic screens, components, states, actions, and clickable prototype flows. | Current structural source rendered by the prototype. |
| [`frontend/rendered-prototype.md`](frontend/rendered-prototype.md) | Instructions and lifecycle for running, improving, and validating the clickable prototype. | Current prototype guide. |
| [`frontend/prototype-review.md`](frontend/prototype-review.md) | Continuous screen-design feedback register, change-routing rules, checkpoints, and final approval criteria. | Working prototype review document. |
| [`source-material/Business Application Engineering Standard.docx`](source-material/Business%20Application%20Engineering%20Standard.docx) | Platform engineering standard for business objects, state, timeline, activities, notifications, permissions, events, and APIs. | Current architecture standard input. |
| [`source-material/gdpr-transfer-review-2026-07-29.md`](source-material/gdpr-transfer-review-2026-07-29.md) | Legal recommendation defining transfer confirmation, customer export, CV-level evidence, and 90-day Jobstream retention. | Current legal requirements input; listed approval points remain production blockers. |
| [`source-material/initial_requirements.md`](source-material/initial_requirements.md) | Original business description and approval-portal request. | Baseline; partially superseded by discovery. |
| [`source-material/initial_specifications.md`](source-material/initial_specifications.md) | Initial HubSpot CMS and serverless MVP proposal. | Draft assumption set; scope is now under review. |
| [`diagrams/workspace.dsl`](diagrams/workspace.dsl) | Standard-aligned C4 context and container model for the customer recruitment portal. | Current architecture baseline; technology/provider decisions remain TODOs. |
| [`diagrams/erd.puml`](diagrams/erd.puml) | Conceptual ERD for the customer recruitment portal application data model. | Current architecture baseline; open policy and source-of-record decisions are marked as TODO. |
| [`diagrams/statecharts/CustomerCandidateWorkflow.puml`](diagrams/statecharts/CustomerCandidateWorkflow.puml) | Customer-side candidate lifecycle model. | Current draft; final transition rules still open. |
| [`diagrams/statecharts/ContactRevealAndCommercialApproval.puml`](diagrams/statecharts/ContactRevealAndCommercialApproval.puml) | Data-transfer confirmation, customer export, retention, and per-candidate commercial approval workflow. | Current draft; confirmation copy and minimized-evidence policy still open. |
| [`diagrams/statecharts/FollowUpReminderWorkflow.puml`](diagrams/statecharts/FollowUpReminderWorkflow.puml) | Follow-up attention and reminder workflow. | Current draft; clock and reminder policy still open. |
| [`diagrams/statecharts/CandidateInterviewEmailWorkflow.puml`](diagrams/statecharts/CandidateInterviewEmailWorkflow.puml) | Fixed first-interview email preview, request, failure, and retry workflow. | Current draft; provider and production template approvals remain open. |
| [`diagrams/c4-model.dsl`](diagrams/c4-model.dsl) | Initial C4 context and container model. | Legacy draft based on approval-focused scope; superseded by `diagrams/workspace.dsl`. |
| [`diagrams/CandidateLifecycle.puml`](diagrams/CandidateLifecycle.puml) | Initial Jobstream-side candidate lifecycle. | Legacy draft; does not model the customer-side pipeline. |
| [`diagrams/VacancyLifecycle.puml`](diagrams/VacancyLifecycle.puml) | Initial vacancy and campaign lifecycle. | Draft. |
| [`diagrams/er-lead-generation.puml`](diagrams/er-lead-generation.puml) | Initial conceptual HubSpot data model. | Draft with unresolved identifiers and associations. |

## Repository Structure

| Path | Purpose |
| --- | --- |
| `meetings/` | Raw meeting evidence and structured summaries. |
| `requirements/` | Formalized, traceable requirements and epics. |
| `frontend/` | UX specification, semantic wireframes, clickable mockup, and prototype review artifacts. |
| `sprints/` | Sprint objectives and committed delivery scope once agreed. |
| `diagrams/` | Editable Structurizr DSL and PlantUML architecture sources. |
| `source-material/` | Future source briefs and imports; existing root sources remain in place to preserve history. |
| `skills/` | Project-local source for reusable Codex skills developed with this project. |

## Open Decisions

Use [`requirements/decision-brief.md`](requirements/decision-brief.md) as the current working list. The main remaining blockers are:

- Who owns and approved the product-direction decision already recorded in the review template?
- What exact confirmation text and privacy-notice wording describe the transfer to an independent controller?
- Which exact profile fields and CV sections are approved before transfer confirmation?
- Which minimized transfer-evidence fields may remain after 90 days, for whom, and for how long?
- Does per-candidate commercial approval create a billable event, and how are incidental or free candidates handled?
- Is account provisioning through an admin portal, a private API endpoint, or both?
- What is the approved customer lifecycle, including terminal outcomes and backward/reopen rules?
- Which rejection reasons and user action logs are required?
- What starts, pauses, resets, and stops the follow-up clock?
- Can HubSpot support transfer confirmation, version-bound export, 90-day disposal, activity history, authorization, action logging, and the lifecycle?
