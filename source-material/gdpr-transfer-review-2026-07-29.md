# GDPR Candidate-Data Transfer Review

## Source Status

| Field | Value |
| --- | --- |
| Review date recorded | 2026-07-29 |
| Source | Legal recommendation supplied by the project owner after review with a lawyer |
| Purpose | Define when and how controller responsibility for candidate data transfers from Jobstream to the customer |
| Interpretation | Legal input for requirements; final agreements, privacy notice, and user-facing legal text still require formal approval |

## Recommended Portal Mechanism

1. Define the transfer point as an explicit customer confirmation in the portal, not as the moment data is moved or removed from a physical storage location.
2. After confirmation, Jobstream retains portal data for its own limited purposes: evidence of introduction relevant to per-CV invoicing and complaint handling.
3. Use Jobstream's stated legitimate interest under Article 6(1)(f) GDPR for that purpose-bound retention.
4. Apply a fixed retention period of 90 days.
5. At confirmation, let the customer download or export an independent copy so the customer can demonstrably act as an independent controller.
6. Log the confirmation at CV level: which customer confirmed which candidate and when.
7. Update the existing data-transfer agreement and privacy notice to describe the portal mechanism, confirmation point, and retention period.

## Product Decisions Applied

- Before confirmation, an authorized customer user may view the approved profile and CV, but not contact details or export.
- The system prepares a version-bound export package before committing confirmation and makes it immediately available afterwards.
- A failed automatic download does not reverse confirmation; the same package can be retried while retained.
- Per-candidate commercial approval is a separate step and must precede transfer confirmation where required.
- Candidate content and generated export packages are deleted or anonymized 90 days after confirmation.
- Only minimized transfer evidence may remain after 90 days under a separately approved policy.

## Remaining Legal Approval

- Confirm that the selected profile and CV access before transfer confirmation is legally acceptable.
- Approve the exact fields and document sections visible before confirmation.
- Approve the exact customer-facing confirmation text.
- Approve updates to the data-transfer agreement and privacy notice.
- Approve the purpose, fields, audience, and retention term for minimized transfer evidence after 90 days.
