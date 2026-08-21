# IP Protection Checklist — 2026-06-29

**Owner:** Osprey Strategic Holdings LLC (Wyoming, June 2026)
**Template:** governance-commons/review-templates/compliance-review.md v0.1
**Status:** Living checklist — update in place as items complete

---

## Copyright

| Item | Status | Notes |
| --- | --- | --- |
| Copyright is automatic on all authored work | done | Exists from moment of creation |
| IP ownership / assignment record for GEE + time.loc | owner clarified 2026-08-21 | Osprey Strategic Holdings LLC owns the IP. HBL Creative Studios developed the deliverables as an internal division/brand of Osprey, not as a separate legal entity. Existing draft at [`docs/reviews/2026-08-19-ip-assignment-draft.md`](2026-08-19-ip-assignment-draft.md) may still be useful as a counsel-reviewed paper trail, but HBLCS should not be treated as a separate assignor or owner. |
| Add `© 2026 Osprey Strategic Holdings LLC` to all repo READMEs | partial — confirmed done in `governed-event`, `time-loc` (2026-08-19) | Remaining repos not yet swept. Owner decision 2026-08-21: broader portfolio copyright sweep is not a blocker for the GEE/time.loc paired release. |
| US Copyright Office registration — GEE spec + Marlin-DXP bundle | non-blocking follow-up for GEE release | Deposit copy ready for GEE (spec files + Python source already exist in `governed-event/spec/` and `governed-event/python/`); Marlin-DXP bundle not assembled. Owner decision 2026-08-21: do not block PyPI release on registration; target filing within 3 months of first public release to preserve stronger remedy posture. $65 online filing (not waived — no pro bono equivalent for copyright registration). |

---

## Trademarks (USPTO Class 42 — Software/Technology Services)

| Mark | Priority | Status | Notes |
| --- | --- | --- | --- |
| Marlin | P0 | not filed | Most user-facing brand; file first; ~$250-350 DIY on USPTO.gov |
| Governance Commons | P1 | not filed | Core brand; distinctive enough for Class 42 |
| Agent Dossier | P1 | not filed | Distinctive technical mark |
| Osprey | P1 | not filed | Company brand; search for conflicts first |
| eco | P2 | not filed | Generic term — narrow scope expected but worth filing |

**How to file DIY:** USPTO.gov → TEAS Plus application → Class 42 → ~$250-350/mark

**GEE/time.loc release decision (2026-08-21):** trademarks are not a blocker
for the paired PyPI release. No GEE or time.loc trademark filing is required
before publication; any future mark review remains a separate portfolio IP task.

---

## Patents

| Subject | Type | Disclosure date | US deadline | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| GEE architecture (authority_basis + time.loc + namespace invariant) | Provisional | June 2026 (confirm exact date before filing) | ~June 2027 | non-blocking defensive follow-up | Owner decision 2026-08-21: do not block PyPI release on provisional patent filing; track as a defensive follow-up. Technical disclosure ready at [`docs/reviews/2026-08-19-gee-provisional-patent-draft.md`](2026-08-19-gee-provisional-patent-draft.md); needs claims drafted (with counsel or Pro Bono attorney) before the 12-month deadline. File within 12 months of first public enabling disclosure/release, sooner if foreign patent rights matter. $320 USPTO fee (not waived by Pro Bono Program — that only waives attorney fees). |
| Marlin mode-detection algorithm | Provisional | TBD | TBD | not filed | Secondary candidate |
| Agent-trail reading chain protocol | Provisional | TBD | TBD | not filed | Tertiary candidate |

**Note on GEE + Apache 2.0:** Apache 2.0 includes a patent license grant to users of the
open-source release. Patent filing on GEE is primarily defensive — prevents third parties
from patenting similar approaches and suing Osprey or GEE users. Not a direct revenue mechanism.

**Patent Pro Bono Program:** USPTO matches low-income inventors with free attorneys.
Apply at: pro-bono.uspto.gov

---

## EU AI Act

| Product | Scope determination | Aug 2026 obligation | Status |
| --- | --- | --- | --- |
| eco (current: dev platform) | Likely not in scope — governance tooling, not AI system | Confirm scope first | pending |
| eco (future: cognitive OS) | Provider obligations will apply when EU customers exist | Build compliance posture into product | planned |
| GEE | Not an AI system — a record format | Not in scope | confirmed |

**SYN-REG-01** (eco DEV-PLAN): ADM transparency schema — 1-2 week spec task if eco is determined to be in scope.

---

## Priority order (budget-constrained)

1. **IP ownership / assignment paper trail** — free, confirm this week
2. **Add copyright notices** — free, do this week
3. **GEE provisional patent** — $320, DIY or pro bono attorney
4. **Marlin trademark** — $250-350, DIY on USPTO.gov
5. **Copyright registration** — $65, USPTO.gov online filing
6. Remaining trademarks — file one per month as budget allows
