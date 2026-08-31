# Engineering Estimate Update: First-Interview Confirmation Email

## Purpose

Please update the existing development estimate to include the newly approved MVP story [`REQ-15`](customer-recruitment-portal-requirements.md#req-15-preview-and-send-first-interview-confirmation). The earlier estimate was based on the requirements before this candidate email flow was added.

This request is for the additional effort and revised total, not a replacement estimate created without reference to the previous breakdown.

## What Changed

When an authorized recruiter schedules a candidate's first interview, the portal must now:

- Render a read-only preview of one fixed, versioned Jobstream email template.
- Select Dutch or English from the candidate's communication preference, defaulting to Dutch.
- Send from `no-reply@jobstream.nl` with the acting recruiter's verified work email as `Reply-To`.
- Save the interview and create an idempotent email request through one explicit confirmation.
- Record the interview and email request, provider acceptance, failure, and retry as separate activities.
- Keep the interview scheduled when sending fails and allow an email-only retry.
- Allow scheduling without email when a valid candidate or recruiter address is unavailable, with manual-notification guidance.
- Apply existing authorization, audit, privacy, and 90-day candidate-data retention rules to notification data.

## Estimate Impact To Review

Please include the incremental work for:

- Candidate communication-language and structured interview-appointment data.
- Versioned Dutch and English templates and token rendering.
- Preview, combined schedule/request, and email-only retry command behavior.
- Durable/idempotent notification requests and delivery attempts.
- Email-provider integration, sender-domain SPF/DKIM/DMARC setup, failure handling, monitoring, and operational configuration.
- Portal preview, success, pending, failure, retry, missing-address, stale-data, permission, and responsive states.
- Timeline/audit events, retention/disposal coverage, automated tests, and release verification.

Identify any overlap with notification, workflow, event, activity, or audit infrastructure already included in the previous estimate so it is not counted twice. Separate reusable platform work and one-time email-domain/provider setup from story-specific implementation.

## Scope Boundary

The MVP includes only the initial first-interview confirmation. Do not include estimates for editable content, customer branding, customer sender domains, follow-up-interview messages, rescheduling, cancellation, offers, rejection, general status updates, inbox synchronization, inbound replies, open/read tracking, WhatsApp, or calling integration.

Provider acceptance must not be treated as proof that the candidate received or read the email.

## Requested Response

Please return:

1. The additional hours by frontend, backend/domain, email/platform setup, data/audit/retention, testing, and operations.
2. The revised total compared with the previous estimate.
3. Which previously estimated components are reused.
4. Assumptions, exclusions, dependencies, and material risks.
5. A confidence range or explicit contingency for unresolved production template approval and email-provider selection.

The detailed technical behavior is in [`engineering-team-brief.md`](engineering-team-brief.md#expected-interview-email-command-boundaries). The workflow is shown in [`CandidateInterviewEmailWorkflow.puml`](../diagrams/statecharts/CandidateInterviewEmailWorkflow.puml).
