Goal: deliver a secure Customer Approval Portal in HubSpot CMS where a logged- in customer can:
1) View candidates that are in Customer Approval stage
2) Approve or Reject candidates, updating the candidate status in HubSpot
3) Ensure customers can only access candidates belonging to their own company and related vacancies

We propose a HubSpot CMS module + serverless functions approach:
- The CMS module provides the portal UI (candidate list + details + approve/reject actions) and matches your website styling.
- Serverless functions query HubSpot CRM objects (Candidate, Job Vacancy, Company relationships) and enforce company-level access control.
- The portal will be hosted as HubSpot Private Content (Membership) for secure customer login

To keep the MVP lightweight and cost-efficient, we assume:
1. Candidate and Job Vacancy are available as HubSpot objects (typically custom objects) with:
-- Candidate status values such as: New, Connected, Qualified_By_Us, Approved_By_Customer, Rejected
-- Job Vacancy lifecycle states as per your diagram
2. There is a reliable relationship to derive the customer’s company scope: either Candidate ↔ Company association, or Candidate → vacancy_id → JobVacancy ↔ Company
3. Workflows for “Campaign_Closed ⇒ reject all associated candidates” are already implemented outside of this portal scope.
4. MVP focuses on approval flow and does not include additional features like distance-based filtering, document management, or complex CRM automation unless explicitly requested.
