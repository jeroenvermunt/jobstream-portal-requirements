// Legacy baseline architecture retained for historical comparison.
// The current customer recruitment portal model is diagrams/workspace.dsl.

workspace "Recruitment Marketing Architecture" "C4 Level 1+2 for a HubSpot-based recruitment marketing flow" {

  model {
    properties {
      "structurizr.groupSeparator" "/"
    }

    // People
    recruiter = person "Recruitment Marketer" "Manages job vacancies, deals and recruitment campaigns in HubSpot." "Person"
    selector = person "Selection Agent" "Calls candidates and maintains candidate statuses in HubSpot." "Person"
    customerUser = person "Customer User" "Reviews and approves candidates via the customer portal." "Person"
    candidate = person "Candidate" "Submits personal details via a Meta lead form." "Person"

    // External systems
    metaAds = softwareSystem "Meta Ads (Facebook Lead Forms)" "Provides lead form submissions from advertising campaigns." "ExternalSystem"
    hubSpot = softwareSystem "HubSpot" "CRM, Workflows and CMS hosting recruitment data and automation." "ExternalSystem"

    // System of interest
    rms = softwareSystem "Recruitment Marketing Platform" "HubSpot-centred system supporting candidate intake, qualification and customer approval." {
      tags "SystemOfInterest"

      // Containers (C4 Level 2)
      crm = container "HubSpot CRM Data Model" "Standard and custom objects: Deal, Company, Job Vacancy and Candidate, including relationships." "HubSpot CRM" "Container"
      portal = container "Customer Portal (HubSpot CMS Module)" "Displays candidate data based on lead pipeline status, linked company and vacancy objects. Support candidate approval." "HubSpot CMS" "Container"

      // Best-effort glue component (assumption)
      integration = container "Lead Intake Integration" "Receives Meta lead events and creates or updates Candidate records in HubSpot. TODO: native vs custom implementation." "HubSpot workflow" "Container"
    }

    // Relationships (System context)
    candidate -> metaAds "Submits lead form"
    metaAds -> rms "Sends lead submissions (webhook/API)" "HTTPS"

    recruiter -> rms "Manages deals, vacancies and campaigns" "Web UI"
    selector -> rms "Contacts candidates and updates their status" "Web UI"
    customerUser -> rms "Reviews and approves candidates" "Web UI"

    // Relationships (Container level)
    integration -> metaAds "Receives lead submissions" "Webhook/HTTPS"
    integration -> crm "Creates/updates Candidate records" "HubSpot API (assumption)"

    portal -> crm "Reads candidate data via lead-company relationship" "HubSpot internal"

    customerUser -> portal "Approves or rejects candidate" "HTTPS"

    recruiter -> crm "Maintains Job Vacancies, Deals and relationships" "HubSpot UI"
    selector -> crm "Updates Candidate status" "HubSpot UI"

    // Hosting context
    recruiter -> hubSpot "Uses HubSpot interface" "HTTPS"
    selector -> hubSpot "Uses HubSpot interface" "HTTPS"
    hubSpot -> rms "Hosts CRM, Workflows and CMS components" "Internal"
  }

  views {
    systemContext rms "SystemContext" {
      include *
      autoLayout lr
      title "System Context – Recruitment Marketing Platform"
    }

    container rms "Containers" {
      include recruiter
      include selector
      include customerUser
      include candidate
      include metaAds
      include crm
      include portal
      include integration
      autoLayout lr
      title "Container View – Recruitment Marketing Platform (HubSpot-centric)"
    }

    styles {
      element "Person" { 
        shape person
      }
      element "ExternalSystem" {
        background "#999999"
        color "#ffffff"
      }
      element "SystemOfInterest" {
        background "#1168bd"
        color "#ffffff"
      }
      element "Container" {
        background "#438dd5"
        color "#ffffff"
      }
    }
  }
}
