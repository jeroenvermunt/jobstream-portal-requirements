workspace "Jobstream Customer Recruitment Portal" "C4 architecture model for the customer-facing recruitment workflow, aligned with the Business Application Engineering Standard." {
    model {
        customerRecruiter = person "Customer Recruiter" "Customer user who reviews assigned Jobstream candidates, confirms the candidate-data transfer, downloads the customer copy, contacts candidates, records outcomes, and progresses the customer-side workflow."
        customerManager = person "Customer Recruitment Manager" "Customer user who reviews candidate progress within an authorized customer scope."
        jobstreamOperations = person "Jobstream Operations User" "Jobstream user who monitors customer follow-up, reviews activity history, and supports stalled candidate progress."
        candidate = person "Candidate" "Data subject represented in the recruitment workflow; not a direct portal user in the first release, but receives fixed transactional interview confirmations."
        privacyOwner = person "Privacy/Security Owner" "Approves confirmation wording, pre-confirmation visibility, minimized evidence, retention, access, audit, and authentication rules before production release."

        hubspot = softwareSystem "HubSpot CRM" "Current source for candidate, vacancy, customer, and association data. TODO: confirm whether HubSpot remains system of record for customer-stage and activity data." "External System"
        identityProvider = softwareSystem "TODO: Identity Provider" "Authenticates assigned customer and Jobstream users. TODO: select identity provider, MFA, account recovery, and session policy." "External System"
        emailClient = softwareSystem "User Email Client" "External mail client opened through mailto links; the portal cannot prove message delivery from this action." "External System"
        whatsApp = softwareSystem "WhatsApp" "External WhatsApp application or web endpoint opened through supported phone links; first release does not verify message delivery." "External System"
        notificationChannels = softwareSystem "TODO: Notification Channels" "External channels used by the Notification Framework for reminders and access messages. TODO: approve channels and cadence." "External System"
        emailDeliveryProvider = softwareSystem "TODO: Email Delivery Provider" "Submits fixed, versioned first-interview confirmation emails from no-reply@jobstream.nl. TODO: select provider and approve SPF, DKIM, DMARC, webhook, and operational controls." "External System"
        inboundEmailProvider = softwareSystem "TODO: Inbound Email Provider" "Receives opaque CC tracking addresses and forwards metadata for verified contact-attempt processing. Message bodies and attachments are not retained." "External System"

        portal = softwareSystem "Customer Recruitment Portal" "Business application that lets authorized customer users review Jobstream candidates, confirm data transfer, obtain a customer copy, and perform contact, follow-up, stage progression, notes, and oversight." "System Of Interest" {
            webApp = container "Portal Web Application" "Dutch/English UI for candidate queue, kanban/list views, candidate detail, transfer confirmation, export download, contact shortcuts, logging, stage updates, collaboration, customer access administration, notifications, fixed interview-email preview/results, guidance, and oversight." "TODO: Web application technology" "Web Application"
            objectApi = container "Business Object API" "Exposes standard object APIs plus idempotent transfer-confirmation, lifecycle-transition, collaboration, access-administration, contact-tracking, interview-email preview/request, and email-retry commands; enforces permission checks consistently for UI, workflows, and integrations." "TODO: API service technology" "API"
            recruitmentModule = container "Customer Recruitment Business Module" "Defines customer recruitment business objects, lifecycle rules, transfer and export rules, structured interview appointments, activity types, notes, mentions, assessments, access grants, retention workflows, and notification requests without reimplementing platform services." "TODO: Application module" "Business Module"
            platformServices = container "Platform Services" "Reusable Object Framework, State Engine, Timeline Engine, Activity Framework, Permission Framework, Workflow Engine, Notification Framework, Template Engine, Audit Framework, Search Framework, and File Framework." "TODO: Shared platform runtime" "Platform Services"
            workflowWorker = container "Workflow And Notification Worker" "Consumes domain events, executes 90-day retention disposal across portal stores, evaluates follow-up workflows, submits durable interview-email requests and reminders, and records timeline activities." "TODO: Worker service technology" "Worker"
            hubspotAdapter = container "HubSpot Synchronization Adapter" "Maps HubSpot candidate, vacancy, company, and association data into portal business objects and synchronizes approved updates where the architecture decision allows it." "TODO: Integration service technology" "Integration"
            contactTrackingAdapter = container "Inbound Contact Tracking Adapter" "Validates opaque CC tokens and verified work-email senders, discards message content and attachments, and submits idempotent metadata-only contact-attempt commands." "TODO: Inbound email integration technology" "Integration"
            applicationDatabase = container "Business Application Data Store" "Stores business objects, lifecycle state, interview appointments, notes, mentions, assessments, user invitations and grants, notification state, contact-tracking metadata, transfer confirmations, minimized evidence, retention state, timelines, activities, permissions, and audit metadata." "PostgreSQL" "Database"
            eventBus = container "Domain Event Bus" "Publishes meaningful business changes for workflows, notifications, integrations, analytics, and audit consumers." "TODO: Event bus technology" "Message Bus"
            searchIndex = container "Search Index" "Supports authorized candidate queue, kanban, and oversight search and removes transfer-context candidate content at the 90-day expiry." "PostgreSQL full-text search and indexes" "Search Index"
            fileStore = container "File Store" "Stores or references approved CV/source documents and version-bound customer export packages; portal-owned transfer copies expire after 90 days. TODO: confirm source-document storage boundary." "TODO: File storage technology" "File Store"
        }

        customerRecruiter -> webApp "Reviews assigned candidates, collaborates with authorized colleagues, confirms data transfer, downloads the customer copy, uses contact shortcuts, logs outcomes, changes stages, and previews/confirms first-interview emails" "HTTPS"
        customerManager -> webApp "Reviews candidates and follow-up progress and administers users and vacancy assignments in an authorized customer scope" "HTTPS"
        jobstreamOperations -> webApp "Reviews oversight views, activity history, stalled candidates, and customer follow-up evidence" "HTTPS"
        privacyOwner -> webApp "Reviews configured privacy/audit behavior where administrative review screens exist" "HTTPS/TODO"

        candidate -> hubspot "Provides source candidate information through the existing Jobstream recruitment process" "Existing process"
        emailDeliveryProvider -> candidate "Submits fixed first-interview confirmation email to" "Email"
        jobstreamOperations -> hubspot "Maintains source candidate, vacancy, customer, and association data where HubSpot remains the operational CRM" "HubSpot UI"

        webApp -> identityProvider "Authenticates assigned users and receives identity/session claims" "OIDC/SAML/TODO"
        webApp -> objectApi "Reads objects and submits transfer-confirmation, export-download, transition, and activity commands" "JSON/HTTPS"
        webApp -> emailClient "Opens mailto contact shortcut after transfer confirmation" "mailto"
        webApp -> whatsApp "Opens WhatsApp contact shortcut after transfer confirmation" "HTTPS/deep link"

        objectApi -> recruitmentModule "Delegates customer recruitment rules, object definitions, validation, and transition commands" "In-process call (ASSUMPTION)"
        objectApi -> platformServices "Uses object, state, timeline, activity, permission, audit, search, and file services" "Internal API"
        recruitmentModule -> platformServices "Configures and invokes shared platform capabilities instead of implementing its own infrastructure" "Internal API"

        platformServices -> applicationDatabase "Persists objects, state, timeline, activities, permissions, and audit metadata" "SQL"
        platformServices -> eventBus "Publishes domain events for meaningful business changes" "TODO"
        platformServices -> searchIndex "Indexes authorized object and timeline data for queue and oversight views" "SQL"
        platformServices -> fileStore "Stores or retrieves CV/source documents and version-bound customer export packages through the File Framework" "TODO"

        workflowWorker -> eventBus "Consumes domain events such as CandidateSupplied, TransferConfirmed, TransferRetentionExpired, StageChanged, CandidateEmailRequested, CandidateEmailRetryRequested, FollowUpOverdue, and CandidateRejected" "TODO"
        workflowWorker -> platformServices "Executes configured workflows, disposes expired database/file/search copies, creates activities, requests notifications, and records disposal evidence" "Internal API"
        workflowWorker -> notificationChannels "Delivers reminders and workflow notifications through approved channels" "TODO"
        workflowWorker -> emailDeliveryProvider "Submits fixed, versioned first-interview emails and records provider acceptance or failure" "HTTPS/TODO"

        inboundEmailProvider -> contactTrackingAdapter "Forwards received CC metadata and transient message content" "Webhook/TODO"
        contactTrackingAdapter -> platformServices "Validates correlation and sender, records one attributable email attempt, and discards body content and attachments" "Internal API"

        hubspotAdapter -> hubspot "Reads and writes approved CRM data and associations" "HubSpot API"
        hubspotAdapter -> platformServices "Creates or updates mapped business objects, relationships, activities, and timeline entries" "Internal API"
        hubspotAdapter -> eventBus "Publishes synchronization and integration events" "TODO"
    }

    views {
        systemContext portal system_context {
            title "System Context - Customer Recruitment Portal"
            include customerRecruiter
            include customerManager
            include jobstreamOperations
            include candidate
            include privacyOwner
            include portal
            include hubspot
            include identityProvider
            include emailClient
            include whatsApp
            include notificationChannels
            include emailDeliveryProvider
            include inboundEmailProvider
            autolayout lr
        }

        container portal containers {
            title "Container View - Platform-Standard Customer Recruitment Portal"
            include customerRecruiter
            include customerManager
            include jobstreamOperations
            include privacyOwner
            include hubspot
            include identityProvider
            include emailClient
            include whatsApp
            include notificationChannels
            include emailDeliveryProvider
            include inboundEmailProvider
            include webApp
            include objectApi
            include recruitmentModule
            include platformServices
            include workflowWorker
            include hubspotAdapter
            include contactTrackingAdapter
            include applicationDatabase
            include eventBus
            include searchIndex
            include fileStore
            autolayout lr
        }

        styles {
            element "Person" {
                shape person
            }
            element "System Of Interest" {
                background "#1168bd"
                color "#ffffff"
            }
            element "External System" {
                background "#999999"
                color "#ffffff"
            }
            element "Web Application" {
                background "#438dd5"
                color "#ffffff"
            }
            element "API" {
                background "#438dd5"
                color "#ffffff"
            }
            element "Business Module" {
                background "#85bbf0"
                color "#000000"
            }
            element "Platform Services" {
                background "#0b6b50"
                color "#ffffff"
            }
            element "Worker" {
                background "#438dd5"
                color "#ffffff"
            }
            element "Integration" {
                background "#438dd5"
                color "#ffffff"
            }
            element "Database" {
                shape cylinder
                background "#2f95d6"
                color "#ffffff"
            }
            element "Message Bus" {
                shape pipe
                background "#f5a623"
                color "#000000"
            }
            element "Search Index" {
                shape cylinder
                background "#2f95d6"
                color "#ffffff"
            }
            element "File Store" {
                shape folder
                background "#2f95d6"
                color "#ffffff"
            }
        }
    }
}
