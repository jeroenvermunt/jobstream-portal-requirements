# Requirements Review Feedback

## Purpose

Use this document to verify the current requirements and leave feedback without editing the canonical requirements directly.

Start from the [decision brief](decision-brief.md). Only refer back to the full [customer recruitment portal requirements](customer-recruitment-portal-requirements.md) when a decision or requirement needs detailed checking.

## Review Details

| Field | Response |
| --- | --- |
| Review date |  |
| Reviewer |  |
| Role or perspective |  |
| Reviewed documents | [decision brief](decision-brief.md), [requirements](customer-recruitment-portal-requirements.md) |
| Review status | Options: Not started, In progress, Feedback ready, Approved with comments, Approved. Selected: |

## How To Leave Feedback

- Use `Confirm` when the current wording is good enough.
- Use `Change` when the requirement is directionally right but the wording or rule is wrong.
- Use `Missing` when a required behavior, rule, actor, or risk is absent.
- Use `Defer` when the item should not block the first release.
- Use `Risk` when the requirement may be unsafe, unbuildable, legally sensitive, or misleading.
- Reference the relevant `REQ-*`, `B-*`, or `FB-*` ID so changes remain traceable.

## Quick Review Checklist

| Check | Response | Notes |
| --- | --- | --- |
| The product direction is correct: lightweight customer-facing ATS workflow, not a narrow approval portal. | Options: Confirm, Change. Selected: Confirm |  |
| Explicit transfer confirmation and an immediate customer copy for all customers is correct. | Options: Confirm, Change, Risk. Selected: confirm | Legal review, 2026-07-29 |
| Per-candidate contracts need separate commercial approval before transfer confirmation. | Options: Confirm, Change, Defer. Selected: confirm |  |
| Jobstream removes or anonymizes post-confirmation candidate content and export packages after 90 days. | Options: Confirm, Change, Risk. Selected: confirm | Legal review, 2026-07-29 |
| Customer users receive assigned accounts and cannot self-register. | Options: Confirm, Change. Selected: confirm|  |
| First-release contact support should be limited to mailto links, WhatsApp links, and phone number display. | Options: Confirm, Change. Selected: confirm |  |
| Users must log real contact actions and outcomes. | Options: Confirm, Change. Selected: confirm |  |
| Rejection requires an explicit rejection reason. | Options: Confirm, Change. Selected: confirm |  |
| The first release should preview and explicitly send one fixed first-interview confirmation, without customer-editable content or branding. | Options: Confirm, Change. Selected: confirm | Product testing, 2026-08-24 |
| Remaining blockers in the decision brief are the right blockers to answer next. | Options: Confirm, Change. Selected: |  |

## Focused Blocker Feedback

Use this section to answer or challenge the blocker decisions from the [decision brief](decision-brief.md).

| ID | Decision needed | Your answer or feedback | Status | Owner or source |
| --- | --- | --- | --- | --- |
| `B-01` | Who owns and approved the product-direction decision recorded in `D-01`? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-02` | What exact legal confirmation text and privacy-notice wording describe the transfer to an independent controller? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-03` | Which exact profile fields and CV sections are approved before transfer confirmation? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-04` | Does per-candidate commercial approval create a billable event, and how are incidental or free candidates handled? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-05` | Is account provisioning through an admin portal, a private API endpoint, or both? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-06` | What is the approved customer lifecycle, including terminal outcomes and backward/reopen rules? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-07` | What rejection reasons are required, and are they structured, free text, or both? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-08` | Which actions must users log, and which fields are required per action? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-09` | What starts, pauses, resets, and stops the follow-up clock? | Starts when Jobstream delivers the candidate; uses elapsed calendar hours; does not pause or reset; stops after the first valid logged contact attempt or outcome. | Options: Open, Proposed, Approved, Deferred. Selected: Approved | `UT-001`, 2026-08-05 |
| `B-10` | Can HubSpot support transfer confirmation, export, 90-day disposal, activity history, authorization, action logging, and the lifecycle? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-11` | Which minimized transfer-evidence fields may remain after 90 days, who may access them, and for how long? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-12` | What exact Dutch and English first-interview template copy and token formatting are approved for production? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |
| `B-13` | Which email delivery provider and sender-domain controls will be used? |  | Options: Open, Proposed, Approved, Deferred. Selected: |  |

## Feedback Log

Add one row per concrete comment. Prefer small, specific feedback over long mixed notes.

| Feedback ID | Type | Reference | Feedback | Proposed wording or decision | Reason | Owner or source | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `FB-01` | Change |  | The candidate application stage needs a state-chart, showing the next allowed stages for the candidate. When updating the stage, it should only show the options allowed in the state chart, and highlight the most obvious option |  |  |  | Open / Applied / Rejected / Deferred |
| `FB-02` | Confirm / Change / Missing / Defer / Risk |  |  |  |  |  | Open / Applied / Rejected / Deferred |
| `FB-03` | Confirm / Change / Missing / Defer / Risk |  |  |  |  |  | Open / Applied / Rejected / Deferred |
| `FB-04` | Confirm / Change / Missing / Defer / Risk |  |  |  |  |  | Open / Applied / Rejected / Deferred |
| `FB-05` | Confirm / Change / Missing / Defer / Risk |  |  |  |  |  | Open / Applied / Rejected / Deferred |

## Example Feedback

```text
Feedback ID: FB-01
Type: Change
Reference: B-03 / REQ-03
Feedback: Contact details should include phone and email after transfer confirmation, but not address.
Proposed wording or decision: Before confirmation, customer users may see the approved profile, CV, and Jobstream summary. After confirmation, they may also see phone and email, but not address.
Reason: Address is not needed for first follow-up.
Owner or source: Product owner review, 2026-07-06
Status: Open
```

## Review Outcome

Complete this after feedback has been collected.

| Outcome | Response |
| --- | --- |
| Requirements approved as-is? | Options: Yes, No. Selected: |
| Requirements approved with listed changes? | Options: Yes, No. Selected: |
| Blocking feedback IDs |  |
| Non-blocking feedback IDs |  |
| Deferred feedback IDs |  |
| Next action |  |
| Next owner |  |
| Due date |  |
