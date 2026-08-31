# Requirement Traceability Matrix

Baseline: `HB-2026-08-31`

| Requirement | Linear outcome | UX reference | Core data concepts | Workflow or architecture reference | Readiness |
| --- | --- | --- | --- | --- | --- |
| `REQ-01` | Authorized tenant and work-scope access | `UX-01`, `UX-02`, `UX-10`, `UX-13` | CustomerTenant, WorkScope, PortalUser, Role, UserAccessGrant | C4 identity, API, permission services | Confirmed; identity and broader scope rules remain decisions |
| `REQ-02` | Candidate work queue | `UX-02` | SourceLead, CustomerCandidate, JobVacancy | C4 web, API, search | Ready |
| `REQ-03` | Candidate profile and available CV | `UX-03`, `UX-06` | Candidate, CandidateDocument, FieldVisibilityPolicy | ContactRevealAndCommercialApproval; C4 file boundary | Conditional on approved field catalogue |
| `REQ-04` | Transfer confirmation, export, and commercial acknowledgement | `UX-04`, `UX-05` | DataTransferConfirmation, CustomerExportPackage, CommercialApproval, RetentionDisposal | ContactRevealAndCommercialApproval | Ready behavior; legal copy and evidence fields remain decisions |
| `REQ-05` | Contact shortcuts and truthful tracking | `UX-06`, `UX-07` | ContactTrackingToken, TrackedEmailReceipt, ActivityEntry | C4 inbound tracking adapter; CustomerCandidateWorkflow | Ready; provider is an enabler decision |
| `REQ-06` | Customer-side candidate pipeline | `UX-02`, `UX-06`, `UX-08`, `UX-12` | StageDefinition, StageTransition, CustomerCandidate | CustomerCandidateWorkflow; CandidateInterviewEmailWorkflow | Conditional on final transition matrix |
| `REQ-07` | Notes and activity history | `UX-07` through `UX-10`, `UX-14` | ActivityEntry, CandidateNote, CandidateMention, RejectionReason | C4 timeline, activity, notification services | Ready; correction and taxonomy decisions remain |
| `REQ-08` | Initial follow-up age | `UX-02`, `UX-06`, `UX-10` | CustomerCandidate, FollowUpPolicy | FollowUpReminderWorkflow | Accepted initial clock; later timing is excluded |
| `REQ-09` | Reminders and escalation | `UX-02`, `UX-10` | FollowUpPolicy, FollowUpReminder, NotificationRequest | FollowUpReminderWorkflow; C4 worker | Conditional on cadence, channel, recipient, and escalation policy |
| `REQ-10` | Operational oversight and service summary | `UX-10`, `UX-11` | CustomerCandidate, ActivityEntry, SourceLead | C4 search and reporting reads | Ready; production metric governance applies |
| `REQ-11` | Dutch and English interface | Cross-cutting, `UX-01` through `UX-14` | PortalUser language, localized definitions/templates | C4 web and template services | Ready |
| `REQ-12` | Standardized workflow and guidance | Cross-cutting | StageDefinition, product-controlled content | CustomerCandidateWorkflow; C4 web | Ready |
| `REQ-13` | Security, privacy, retention, and audit | Cross-cutting | FieldVisibilityPolicy, RetentionDisposal, MinimizedTransferEvidence, AuditEvent | All C4 containers and workflows | Conditional on security and privacy decisions |
| `REQ-14` | Source data and system boundary | Cross-cutting | SourceLead and all synchronized records | C4 HubSpot adapter and data stores | Conditional on architecture decision record |
| `REQ-15` | First-interview confirmation | `UX-12` | InterviewAppointment, NotificationTemplate, NotificationRequest, NotificationDeliveryAttempt | CandidateInterviewEmailWorkflow; C4 worker/provider | Ready; provider and production copy are enabling decisions |
| `REQ-16` | Core mobile web experience | Cross-cutting | No separate domain entity | C4 web; all core prototype flows | Ready |
| `REQ-17` | Customer user and vacancy administration | `UX-13` | UserInvitation, UserAccessGrant, WorkScope, PortalUser | C4 web, API, identity and permission services | Ready for backlog refinement; recovery is controlled operations work |
| `REQ-18` | Attributable candidate collaboration | `UX-14` | CandidateNote, CandidateMention, CandidateAssessment, UserNotification | C4 web, API, activity and notification services | Ready |

## Traceability Rules

- Each requirement has exactly one parent outcome issue in Linear.
- Enabling and decision issues list the requirement identifiers they support and use blocking relationships instead of duplicating outcomes.
- A prototype screen may support multiple outcomes; it must not be treated as a standalone production story unless it delivers an independently testable user outcome.
- Accepted styling changes are verified through production design and accessibility review rather than copied into this matrix.
