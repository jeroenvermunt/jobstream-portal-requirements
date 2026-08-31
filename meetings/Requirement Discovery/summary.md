# Requirement Discovery

The discussion reviewed an initial customer approval portal concept and broadened it into a lightweight customer-facing ATS. Customer recruiters should not merely approve or reject candidates: they should be able to contact them, progress them through a defined pipeline, and record follow-up so Jobstream can monitor outcomes and intervene when candidates are not handled promptly. The transcript is automatic and occasionally unclear, so this summary should be validated before it becomes a formal specification.

## Purpose And Participants

- **Purpose:** Clarify what customers must be able to do with candidates after Jobstream hands them over and use early screen concepts to expose missing requirements.
- **Participants:** Jeroen, Flip, and other Jobstream stakeholders whose names or roles are not consistently attributable in the transcript.
- **Time frame:** Approximately 53 minutes; meeting date is not stated in the source.

## Decisions And Agreed Direction

- The approval-only concept is insufficient for the primary customer workflow. Customer recruiters need to work candidates through follow-up stages.
- Candidate progression must remain visible to Jobstream, including whether and when a candidate was contacted.
- Status changes or closing actions should require a short note so activity remains traceable.
- The product should prescribe a simple, standardized recruitment process instead of becoming highly configurable per customer.
- Candidate contact should happen quickly, with 24 to 48 hours discussed as the operational expectation.
- Dutch and English interface text should be supported; uploaded source documents do not need automatic translation in the first instance.
- The UX should be simple enough to use with minimal training and should guide users toward the next action.
- External ATS imports and customer-specific integrations are later or separately priced work rather than assumed first-release scope.

## Candidate Requirements

- Show candidates in a customer-specific pipeline with stages such as supplied, contacted, intake planned, documents requested, offer made, hired, or rejected; the exact vocabulary remains open.
- Let customer recruiters open candidate details and use shortcuts for phone, email, or WhatsApp where technically feasible.
- Require or strongly prompt a note when a candidate is progressed, rejected, or closed.
- Record login, candidate reveal, contact shortcut, status, and note activity when required for operational reporting and accountability.
- Show how long candidates have remained without action and support configurable reminders or notifications.
- Provide Jobstream with aggregate visibility across customer recruiters, locations, or departments.
- Consider initially obscuring identifying details and logging a one-time reveal action; the commercial and privacy rules are unresolved.
- Support onboarding guidance and potentially contextual help or an AI assistant for recurring customer questions.
- Keep tenants isolated so one customer cannot access another customer's candidates or imported records.
- Consider photo and CV presentation, including structured extraction from CVs, but validate necessity and privacy implications first.

## Action Items

- **Jeroen** — Convert the recording into formal requirements, review them, and iterate the UX concepts — **Due:** unspecified.
- **Jeroen and Sander** — Review detailed UX behavior, controls, and screen layout after requirements are clarified — **Due:** unspecified.
- **Jobstream team** — Validate the concept with three existing customers using a demo — **Due:** unspecified.
- **Unassigned** — Ask Pim/IPster for integration documentation and clarify whether their team or Jobstream implements chat, WhatsApp, and calling capabilities — **Due:** unspecified.
- **Unassigned** — Schedule a session with Dylan and Lisa to identify recurring customer questions and useful guidance content — **Due:** unspecified.
- **Unassigned** — Schedule the next requirements session for Tuesday the 23rd at 14:00; month and year are not stated — **Due:** Tuesday the 23rd, 14:00.
- **Implementation team** — Estimate cost and sequencing only after the requirements and UX flow are sufficiently specified — **Due:** unspecified.

## Open Questions

- What is the minimum viable customer pipeline, and which functions are deferred?
- Does the solution remain inside HubSpot CMS, or does the expanded ATS scope require a separate application and database?
- How should customer users be partitioned by company, department, location, and vacancy?
- Which candidate fields, CV data, contact details, and photos are shown before and after a reveal action?
- What actions must be logged for operational reporting, privacy compliance, and dispute handling?
- How should email or WhatsApp activity be initiated and verified without full inbox integration?
- What reminder cadence improves follow-up without generating notification fatigue?
- What metrics should be shown to customers or Jobstream, and which comparisons are appropriate?
- How should external candidates and external ATS systems be imported or synchronized in later phases?
- Which AI assistant capabilities are already covered by the IPster agreement?
- What pricing applies to portal access, subscriptions, onboarding, per-candidate approval, and integrations?

## Risks And Blockers

- The initial requirements, diagrams, and solution proposal describe a narrower approval portal and are not yet aligned with the expanded ATS direction.
- The architecture cannot be finalized until HubSpot limitations, tenant isolation, activity logging, and integration needs are assessed.
- Numerous ideas were discussed without explicit prioritization, creating a material risk of uncontrolled first-release scope.
- Candidate visibility, activity monitoring, and performance analytics introduce privacy, retention, fairness, and access-control questions.
- The brand book and final visual identity are not ready.

## Source

- [`transcript.txt`](transcript.txt), approximately 53 minutes, automatic Dutch transcript.
