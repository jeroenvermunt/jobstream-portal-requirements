Description

I have another request for a rough estimate, it's the same portal as issue https://support.aimfirstvn.com/issues/11322, but a different project.

Description of situation
The Recruitment Marketing Platform is built around HubSpot and supports the end-to-end flow of sourcing, qualifying, and presenting candidates to customers.

The process starts when a customer engages in a recruitment deal. Once the deal progresses, a Job Vacancy object is created in HubSpot. The vacancy lifecycle ensures that the customer first provides content preferences and candidate requirements. When these inputs are available and the deal is won, a recruitment marketing campaign can be started.

For active vacancies, Meta (Facebook) lead campaigns are used to attract candidates. Each vacancy is linked to a specific Meta lead form via HubSpot workflows. When a candidate submits a lead form, a Candidate object is automatically created in HubSpot.

A Selection Agent is responsible for calling candidates and managing their progression through defined candidate statuses (e.g. new, contacted, qualified). Once a candidate is internally qualified, they move to a customer approval stage.

Candidates in the customer approval stage become visible in a customer portal, implemented as a HubSpot CMS module. The portal retrieves candidate data based on the relationship between candidates, vacancies, and the customer’s company. Through the portal, the customer can approve or reject candidates.

If a vacancy’s campaign is closed, all candidates associated with that vacancy are automatically rejected via business rules or workflows, ensuring data consistency and a clean end state.

Overall, HubSpot acts as the central system, combining CRM data, workflows, and CMS functionality, while Meta provides the external lead generation channel.

Requested
This request is specifically for the Customer Portal (HubSpot CMS module). The rest is already in place.

I have a few document that should help:
- System context
- Container view: Shows the role of the Customer Portal to be created
- ER-diagram: Shows relevant data-model
- Job Vacancy lifecycle: Shows lifecycle of job vacancy object
- Candidate lifecycle: Show lifecycle of candidate (lead object in HubSpot)
