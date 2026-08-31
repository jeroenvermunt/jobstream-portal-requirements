# Customer Recruitment Portal Screen Design Brief

## Use

Design only the screens, components, states, and clickable prototype paths below. Keep unresolved business, privacy, commercial, and architecture rules as visible design annotations or placeholder copy. Do not solve those decisions inside the UI design.

## Screen Flow

| Flow | Screen sequence |
| --- | --- |
| Recruiter main path | Sign-in -> Hybrid candidate queue -> Candidate detail before confirmation -> Transfer confirmation -> Customer copy download -> Candidate detail after confirmation -> Contact action -> Log outcome -> Stage update -> Interview email preview -> Updated candidate detail |
| Rejection variant | Candidate detail -> Stage update -> Rejection reason -> Updated candidate detail |
| Commercial acknowledgement variant | Candidate detail before confirmation -> Combined transfer prompt with commercial checkbox -> Customer copy download -> Candidate detail after confirmation |
| Oversight path | Oversight dashboard -> Candidate detail read-only -> Activity history |
| Customer activity path | Scope activity feed -> Filter by vacancy or event -> Candidate detail |
| Service overview path | Service overview -> Change delivery period or vacancy |
| Empty access path | Sign-in -> Empty queue or no assigned candidates |

## Screen Set

| ID | Screen or frame | Design priority |
| --- | --- | --- |
| S01 | Sign-in and access help | Required |
| S02 | Hybrid candidate queue | Required |
| S03 | Candidate queue empty and no-access states | Required |
| S04 | Candidate detail before transfer confirmation | Required |
| S05 | Data-transfer confirmation and export prompt | Required |
| S06 | Candidate detail after transfer confirmation | Required |
| S07 | Commercial acknowledgement in transfer prompt | Required as variant |
| S08 | Contact action panel | Required |
| S09 | Log action or outcome dialog | Required |
| S10 | Stage update dialog | Required |
| S11 | Rejection reason variant | Required as variant |
| S12 | Activity history | Required |
| S13 | Follow-up attention indicators | Required component |
| S14 | Oversight dashboard | Required |
| S15 | Read-only candidate detail | Required |
| S16 | First-use guidance | Optional but useful |
| S17 | Language selector | Required component |
| S18 | Error, loading, permission, and validation states | Required state set |
| S19 | Scope activity feed | Required |
| S20 | Customer service overview | Required for customer managers |
| S21 | First-interview email preview and send result | Required |

## Global Shell

**Layout areas**

- Header with product name, current customer or scope, language selector, user menu, and help entry.
- Main navigation with candidate queue as the default entry.
- `Activity` as a top-level destination for authorized customer users.
- `Overview` as a top-level destination only for customer managers.
- Oversight navigation item only for users who can use it.
- Main content area optimized for candidate work, not broad reporting.
- Mobile layout that turns dense tables and kanban columns into scannable candidate cards.

**Global states**

- Loading.
- Save in progress.
- Save failed.
- Session expired.
- Permission denied.
- No assigned scope.
- Unsupported or missing data.

## S01: Sign-In And Access Help

**Frame goal**

Let assigned users enter the portal and understand what to do if they do not have access.

**Layout areas**

- Centered sign-in card.
- Language selector.
- Access-help text.
- Support or contact link.

**Actions**

- Sign in.
- Recover access or contact support.
- Change language.

**States**

- Default.
- Invalid credentials.
- Expired session.
- Access denied.
- Signed in but no assigned candidates.

**Design constraint**

Do not show public self-registration as a primary or secondary path.

## S02: Hybrid Candidate Queue

**Frame goal**

Help a recruiter identify which candidate to work on next while retaining a
clear view of lifecycle status and progression.

**Layout areas**

- Page title and current scope.
- Filter or chip row for attention status, stage, vacancy, and scope where available.
- Compact `Next to act` section above the board with at most three candidates.
- Kanban columns grouped by current lifecycle stage.
- Information-rich candidate cards inside each column.
- Labelled stage selector with counts on mobile, showing one stage at a time.
- Empty-state area.

**Candidate row or card content**

- Candidate display name or placeholder identifier.
- Vacancy or campaign context.
- Current stage chip.
- Latest recorded activity.
- Follow-up attention indicator.
- Next-action hint.
- Open detail action.

**Actions**

- Open candidate detail.
- Filter or sort by attention status.
- Filter by stage.
- Filter by vacancy or scope, where available.

**States**

- Candidates awaiting first action.
- Candidates in progress.
- Candidates requiring attention.
- No candidates.
- No candidates matching filters.
- No access to selected scope.
- Candidate data partially missing.

**Ordering behavior**

- Show `Follow up · older than 48h` before `Follow up · 24-48h` before
  `Follow up · new (<24h)` before `Follow-up recorded`.
- Within the same follow-up status, show the oldest delivery first and
  use candidate name as the final tie-breaker.
- Exclude `Hired or signed` and `Rejected` candidates from `Next to act` while
  keeping both terminal stages distinct on the board.
- Apply filters to the priority section, board cards, and stage counts together.
- Present the result as a transparent work order based on elapsed calendar time.

**Design constraint**

Treat kanban as the primary visual grouping. Do not use drag and drop for stage
updates. Open stage changes in a side panel over candidate detail so context
remains visible while required notes and rejection reasons are captured.
Use compact column headers that describe the action or outcome that put the
candidate in that stage. Keep full lifecycle names in filters, forms, and history.

**Annotation needed**

Mark the proposed column model and mobile behavior.

## S03: Empty And No-Access Queue States

**Frame goal**

Make empty or blocked work states understandable without exposing hidden candidate data.

**States to design**

- No assigned candidates yet.
- User has no active customer scope.
- Current filters return no results.
- Candidate is no longer available.
- User does not have permission for selected scope.

**Copy direction**

- Use recovery-oriented copy.
- Avoid mentioning candidate counts or details the user may not access.
- Provide a support route when access assignment may be missing.

## S04: Candidate Detail Before Transfer Confirmation

**Frame goal**

Show the approved candidate profile and CV while keeping contact details and export unavailable until transfer confirmation.

**Layout areas**

- Candidate header with name or identifier, current stage, vacancy context, and attention indicator.
- Candidate information panel.
- CV or source document panel.
- Contact-details placeholder panel.
- Customer-copy placeholder panel.
- Next-action panel.
- Activity history preview.

**Actions**

- Open CV or source document.
- Start data-transfer confirmation.
- Update stage if the current process allows it.
- Open full activity history.

**States**

- Contact details hidden.
- Export unavailable.
- CV available.
- CV missing.
- Candidate information partially missing.
- User can confirm transfer.
- User cannot confirm transfer.
- Read-only mode.

**Annotation needed**

Mark the exact profile fields and CV sections visible before confirmation. This pre-confirmation access requires legal approval before production.

## S05: Data-Transfer Confirmation And Export Prompt

**Frame goal**

Make transfer confirmation deliberate without turning it into a high-pressure legal screen.

**Required pattern**

- Compact modal over the candidate detail page.

**Layout areas**

- One short plain-language transfer consequence.
- Candidate and vacancy context.
- Privacy-notice link.
- Conditional commercial checkbox from `S07`.
- Primary `Confirm transfer` action.
- Secondary cancel action.

Do not show contract-level legal copy, document metadata, export composition, or
retention detail in this modal.

**States**

- Ready to confirm.
- Preparing export package.
- Export package preparation failed; confirmation not recorded.
- Short prompt or privacy link unavailable.
- Commercial acknowledgement required and unselected.
- User not allowed to confirm.
- Transfer confirmed and download starting.
- Transfer confirmed but automatic download failed; retry available.
- Duplicate submission returns the existing confirmation and export package.
- Confirmation save failed.

**Copy direction**

Use one short placeholder sentence and annotate that production wording and the privacy-notice link require approval and versioning. The applicable contract carries the detailed terms.

## S06: Candidate Detail After Transfer Confirmation

**Frame goal**

Show contact details, the confirmed customer copy, retention status, and recruitment follow-up from one place.

**Layout areas**

- Candidate header.
- Contact action panel.
- Candidate information panel.
- CV or source document panel.
- Transfer-confirmation summary with actor and date.
- Customer-copy download panel with document version.
- Jobstream retention expiry date.
- Stage and next-action panel.
- Activity history.

**Actions**

- Open email action.
- Open WhatsApp action.
- View or copy phone number, if supported.
- Log action or outcome.
- Update stage.
- Reject candidate.
- Open full history.
- Retry download of the same customer copy while it is retained.

**States**

- Email available.
- WhatsApp available.
- Phone available.
- One or more contact methods unavailable.
- Customer copy available.
- Customer-copy download failed with retry.
- Customer copy expired after 90 days.
- Retention disposal completed.
- Contact action invoked.
- Outcome still not logged.
- Candidate in terminal stage.
- Read-only mode.

## S07: Commercial Acknowledgement Variant

**Frame goal**

Add the applicable commercial acknowledgement to the lightweight transfer prompt without introducing a separate screen.

**Layout areas**

- One conditional commercial checkbox inside the transfer modal.
- Concise placeholder for the approved commercial statement.
- Candidate and vacancy context.
- Shared transfer-confirmation action.
- Shared cancel action.

**States**

- Acknowledgement not required.
- Acknowledgement required and unselected.
- Acknowledgement selected.
- Combined submission failed before commit.
- Commercial and transfer evidence saved.

**Design constraint**

Keep the statement concise. The checkbox records the commercial decision while the transfer button remains the explicit transfer action; detailed terms remain in the contract.

## S08: Contact Action Panel

**Component goal**

Let the recruiter start contact and then log what actually happened.

**Layout areas**

- Email button.
- WhatsApp button.
- Phone display or phone action.
- Optional message template preview.
- Follow-up prompt to log outcome.

**Actions**

- Open mailto action.
- Open WhatsApp action.
- View phone number.
- Copy phone number, if supported.
- Log outcome.

**States**

- Contact details hidden.
- Contact details visible.
- Contact method unavailable.
- Contact action invoked.
- Log outcome prompt active.

**Design constraint**

Do not visually imply that clicking a contact shortcut means the candidate was reached.

## S09: Log Action Or Outcome Dialog

**Frame goal**

Capture the user's reported action or outcome with minimal friction.

**Layout areas**

- Action or outcome selector.
- Optional channel selector.
- Date and time field.
- Note field.
- Save and cancel actions.

**States**

- Empty form.
- Required field missing.
- Saving.
- Saved.
- Save failed.
- Correction requested.

**Annotation needed**

Action and outcome labels are placeholders until the final taxonomy is approved.

## S10: Stage Update Dialog

**Frame goal**

Let the user move the candidate to the next stage and capture required supporting text.

**Layout areas**

- Current stage.
- Next stage selector.
- Required note field.
- Save and cancel actions.

**States**

- Default update.
- Required note missing.
- Stage not available.
- Saving.
- Saved.
- Save failed.
- Reopen or backward transition requested.
- First-interview details ready for email preview.

**Annotation needed**

Stage labels and allowed transitions are provisional.

## S11: Rejection Reason Variant

**Frame goal**

Prevent rejection from being saved without a reason.

**Layout areas**

- Rejection reason selector.
- Optional supporting note.
- Confirmation action.
- Cancel action.

**States**

- No reason selected.
- Reason selected.
- Required note missing, if applicable.
- Rejection saved.
- Save failed.

**Annotation needed**

Reason labels are placeholders until approved.

## S12: Activity History

**Frame goal**

Show what happened to a candidate in a readable timeline.

**Layout areas**

- Chronological event list.
- Event type.
- Actor.
- Date and time.
- Stage change details where relevant.
- Note or reason where relevant.
- System-observed versus user-reported indicator.

**Event types to style**

- Data-transfer confirmation.
- Customer export prepared or downloaded.
- Retention disposal completed.
- Commercial acknowledgement recorded.
- Contact shortcut invoked.
- User logged action or outcome.
- Stage changed.
- First-interview email requested.
- First-interview email accepted for sending.
- First-interview email failed or retried.
- Candidate rejected.
- Note added.

**States**

- No history.
- Short history preview.
- Full history.
- Read-only history.
- Corrected or edited event, if supported.

## S13: Follow-Up Attention Indicators

**Component goal**

Show follow-up urgency consistently across queue, detail, and oversight screens.

**Placements**

- Candidate queue row or card.
- Candidate detail header.
- Oversight dashboard row.
- Reminder or alert area.

**States**

- Follow up · new (<24h).
- Follow up · 24-48h.
- Follow up · older than 48h.
- Follow-up recorded.

**Copy direction**

Every open state calls for follow-up. Use elapsed-time wording to distinguish
priority without assigning blame.

**Annotation needed**

The clock uses elapsed calendar time from candidate delivery and stops after
the first valid logged contact attempt or outcome.

## S14: Oversight Dashboard

**Frame goal**

Give authorized oversight users a screen for reviewing candidate progress and stalled follow-up.

**Layout areas**

- Scope selector.
- Filter row for attention status, customer, vacancy, stage, and responsible person where available.
- Candidate list.
- Latest activity column or card area.
- Attention indicator.
- Open read-only detail action.

**Actions**

- Filter by scope.
- Filter by attention status.
- Open read-only candidate detail.
- Open activity history.

**States**

- One scope.
- Multiple scopes.
- Candidates requiring attention.
- No candidates in selected scope.
- No oversight permission.
- Data partially unavailable.

**Design constraint**

Do not make this screen feel like employee surveillance or cross-customer benchmarking.

## S15: Read-Only Candidate Detail

**Frame goal**

Let oversight users inspect candidate status and activity without editing candidate workflow data.

**Layout areas**

- Candidate header.
- Current stage and attention indicator.
- Candidate information panel.
- Contact visibility area, if permitted.
- Activity history.
- Latest note area.

**Actions**

- View history.
- Change filters or return to oversight dashboard.
- Contact support or responsible user, if a future screen supports it.

**States**

- Full read-only access.
- Limited read-only access.
- Contact details hidden.
- Activity hidden by permission.
- Candidate no longer in scope.

## S16: First-Use Guidance

**Frame goal**

Give first-time users a short explanation of how to use the workflow.

**Design options**

- Intro panel on first queue visit.
- Dismissible checklist.
- Contextual help on candidate detail.
- Help drawer.

**Content areas**

- What the queue is for.
- What transfer confirmation means.
- How the customer copy and 90-day Jobstream retention work.
- How contact actions and outcome logging differ.
- How stage updates work.
- Where to get support.

**States**

- First visit.
- Guidance dismissed.
- Help reopened.

## S17: Language Selector

**Component goal**

Let product-controlled interface text switch between Dutch and English.

**Placements**

- Sign-in screen.
- Header user menu.
- Account settings, if designed.

**States**

- Dutch selected.
- English selected.
- Language changed successfully.
- Language change failed.

**Design constraint**

Do not translate CVs, source documents, or user-entered notes in the UI design.

## S18: Error, Loading, Permission, And Validation States

**State set to design**

- Page loading.
- Section loading.
- Save in progress.
- Save failed.
- Required note missing.
- Rejection reason missing.
- Contact method unavailable.
- Contact details unavailable before transfer confirmation.
- Transfer confirmation not permitted.
- Export preparation failed before confirmation.
- Automatic download failed after confirmation; retry available.
- Customer copy expired.
- Candidate not found or no longer assigned.
- Permission denied.
- Session expired.

**Design direction**

- Use clear recovery actions.
- Avoid leaking hidden candidate data.
- Keep validation close to the field or action it blocks.
- Preserve entered text after save failure where possible.

## S19: Scope Activity Feed

**Frame goal**

Let an authorized user review recent activity across all candidates in the active customer scope and open the relevant candidate record.

**Layout areas**

- Page title and active-scope context.
- Vacancy and event-type filters.
- Newest-first vertical timeline, defaulting to the last 30 days and using the same connected markers, event cards, information hierarchy, and source treatment as candidate activity history.
- Candidate, vacancy, event, actor or system source, localized timestamp, source-kind label, and permitted details per event.

**Rules**

- Derive display dates from ISO occurrence timestamps.
- Distinguish system-observed from user-reported activity in text as well as styling.
- Keep candidate name, vacancy, and the explicit candidate-open action within the event card; do not split timestamps or candidate context into separate table-like columns.
- Exclude every candidate outside the viewer's active authorized scope, including from counts and empty-state copy.
- Opening an event goes to the appropriate candidate record.

**States**

- Loading.
- Ready.
- Empty period.
- No events matching filters.
- Partial data.
- Permission denied.
- Load failed.

## S20: Customer Service Overview

**Frame goal**

Give an authorized customer manager a neutral, reproducible summary of services Jobstream delivered for one customer scope.

**Layout areas**

- Page title, active scope, selected delivery period, and vacancy filter.
- One visual summary table with the delivered total in its caption.
- Grouped table rows for match distribution, first-contact distribution, historically reached steps, and current status.
- An exact candidate count, percentage of delivered candidates, and neutral inline bar in every result row.

**Rules**

- Default to `Since service start`; changing period or vacancy changes the delivered-candidate cohort for every figure together.
- Count interview and offer attainment from historical lifecycle events even after later progression or rejection.
- `Strict match` means the candidate satisfies the jointly agreed qualification criteria. `Additional candidate` means Jobstream delivered the candidate under the broader receive-all-candidates service choice.
- Keep the ready state label-led. The `% of delivered` column and `Historically reached` row group replace separate denominator and historical-event explanations; do not add explanatory paragraphs, legends, or KPI cards.
- Keep the semantic three-column table on mobile, allow labels to wrap, and avoid horizontal viewport scrolling or card conversion.
- KPI elements are informational and do not link to queues, people, or candidate records.
- Do not use urgency styling, comparisons between employees or customers, predictions, recommendations, or attention ranking.
- Hide navigation from ordinary recruiters. Direct recruiter access shows permission denied without any metric or cohort disclosure.

**States**

- Loading.
- Ready.
- Empty period.
- No candidates matching filters.
- Partial data.
- Permission denied without metrics.
- Load failed.

## S21: First-Interview Email Preview And Send Result

**Frame goal**

Let the recruiter verify the candidate-visible appointment information and deliberately schedule the interview with the fixed Jobstream confirmation email.

**Layout areas**

- Candidate and vacancy context.
- Read-only recipient, sender, and reply-address summary.
- Template language and version indicator.
- Read-only subject and rendered email body.
- Back-to-edit action.
- Combined schedule-and-send action.
- Schedule-without-email action when an address prerequisite is unavailable.
- Separate interview-save and email-request result areas.
- Email-only retry and manual-inbox guidance after failure.

**Design constraints**

- Do not show content, branding, subject, sender, reply-address, token, or style editing controls.
- Make `no-reply@jobstream.nl` and the recruiter `Reply-To` address visible before confirmation.
- Make the combined action explicit about both scheduling and requesting the email.
- Do not label provider acceptance as delivered, received, opened, or read.
- Keep the saved interview visually successful when email sending fails.
- Retry acts only on the email and must not look like a second stage update.

**States**

- Loading preview.
- Dutch preview.
- English preview.
- Dutch fallback because no supported candidate preference is available.
- Candidate email unavailable or invalid.
- Recruiter reply address unavailable or invalid.
- Confirming schedule and email request.
- Interview saved and email accepted for sending.
- Interview saved and email pending.
- Interview saved and email failed.
- Retrying email.
- Retry accepted.
- Retry failed with manual-inbox guidance.
- Candidate or appointment changed before confirmation.
- Session expired or permission denied.

## Clickable Prototype Paths

### Path A: Main Recruiter Path

1. Sign in.
2. Open the hybrid candidate queue.
3. Identify the first candidate in `Next to act` while checking lifecycle context.
4. Open the candidate from the ranked section or kanban card.
5. View the approved profile and CV before confirmation.
6. Confirm the candidate-data transfer.
7. Receive the version-bound customer copy.
8. View contact details.
9. Open a contact action.
10. Log the real outcome.
11. Enter the first-interview details.
12. Review the fixed interview-confirmation email.
13. Confirm the combined schedule-and-send action.
14. See the saved interview and separate email-request result.
15. See updated detail and activity history.

### Path B: Commercial Acknowledgement Variant

1. Open candidate detail before confirmation.
2. Open the lightweight transfer prompt.
3. Select the commercial acknowledgement.
4. Confirm the candidate-data transfer.
5. Receive the customer copy and return to detail with contact actions available.

### Path C: Rejection Variant

1. Open candidate detail.
2. Start stage update.
3. Choose rejection.
4. Try to save without a reason.
5. Add reason.
6. Save and view updated history.

### Path D: Oversight Path

1. Open oversight dashboard.
2. Filter to candidates requiring attention.
3. Open read-only candidate detail.
4. Inspect activity history.

### Path E: Empty Or Blocked Path

1. Sign in.
2. See empty queue or no-access state.
3. Use support or access-help route.

### Path F: Activity And Service Overview

1. Open `Activity` and filter recent events by vacancy or event type.
2. Open a candidate from an authorized event and return to the feed.
3. As a customer manager, open `Overview` and change the delivery period or vacancy.
4. Switch the review persona to customer recruiter and verify that `Overview` disappears and direct access is denied without metrics.

### Path G: Interview Email Failure Variant

1. Enter valid first-interview details.
2. Review and confirm the fixed email preview.
3. See that the interview was saved but the email request failed.
4. Retry only the email.
5. If retry fails, use the manual-inbox guidance without changing the interview stage.

### Path H: Interview Email Unavailable Variant

1. Enter valid first-interview details for a candidate without a valid email address.
2. See why platform email is unavailable.
3. Schedule the interview without email.
4. See the manual candidate-notification guidance.

## Design Annotations To Leave In The File

| Area | Annotation needed |
| --- | --- |
| Candidate detail | Exact profile fields and CV sections shown before confirmation. |
| Candidate queue | Ranked-section density, card content density, column grouping, and mobile stage-selector behavior. |
| Transfer confirmation | Final short confirmation sentence, privacy-notice link, and prompt/version identifiers; do not repeat contract-level legal copy. |
| Customer copy | Download format, retry behavior, document-version display, and expired state. |
| Commercial acknowledgement | Final approved checkbox wording and consequence for applicable contracts. |
| Stage update | Final stage labels and transition rules. |
| Rejection | Final rejection reason labels. |
| Action logging | Final action and outcome labels. |
| Follow-up indicators | Final timing thresholds and labels. |
| Activity history | Which events are visible to each role. |
| Retention | How the 90-day expiry and completed disposal are communicated without exposing removed data. |
| Access states | Final access-help wording. |
| Responsive design | Desktop, tablet, and mobile layout decisions. |
| Interview email preview | Final Dutch and English copy, token formatting, fixed-template version display, address-unavailable treatment, and separation of interview-save from email-request status. |
