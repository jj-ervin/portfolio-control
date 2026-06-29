# Repository License Audit — 2026-06-29

**Auditor:** Jess Ervin (jj-ervin) + Claude Code
**Template:** governance-commons/review-templates/license-audit.md v0.1
**Entity:** Osprey Strategic Holdings LLC (Wyoming, incorporated June 2026)
**IP assignment executed:** No — pending (see ip-checklist)

---

## Pre-audit state (before this session)

| Repo | License found | Copyright holder | Notes |
| --- | --- | --- | --- |
| `governed-event` | Apache 2.0 | Osprey Strategic Holdings LLC | Correct |
| `time-loc` | Apache 2.0 | Osprey Strategic Holdings LLC | Correct |
| `niji` | MIT | jj-ervin (personal) | Wrong owner |
| `eco` | Placeholder text | None | Invalid — not a real license |
| `cockpit` | None | — | All rights reserved by default |
| `dxp-init` (Marlin-DXP) | None | — | All rights reserved by default |
| `governance-commons` | None | — | Open standard with no license — adoption blocker |
| `devx-control-plane` | None | — | Distributable tool with no license |
| `doc-vault-plane` | None | — | Early scaffold — fine for now |
| `lasso` | None | — | Early stage — fine for now |
| `arche` | None | — | Early stage — fine for now |
| `elan` | None | — | Early stage — fine for now |
| `kinjuu` | None | — | Early stage — fine for now |

---

## Remediation applied (2026-06-29)

| Repo | Action | License applied | Pushed |
| --- | --- | --- | --- |
| `governance-commons` | Added LICENSE | Apache 2.0 — Osprey LLC | yes |
| `eco` | Replaced placeholder | BUSL 1.1 → Apache 2.0 (2030-06-01) — Osprey LLC | yes |
| `dxp-init` (Marlin-DXP) | Added LICENSE | BUSL 1.1 → Apache 2.0 (2030-06-01) — Osprey LLC | yes |
| `niji` | Updated copyright holder | MIT — Osprey LLC | yes |
| `devx-control-plane` | Added dual license | GPL v3 (open) + commercial (Osprey) | yes |

---

## Post-audit state

| Repo | License | Copyright | Policy match |
| --- | --- | --- | --- |
| `governed-event` | Apache 2.0 | Osprey LLC | yes |
| `time-loc` | Apache 2.0 | Osprey LLC | yes |
| `governance-commons` | Apache 2.0 | Osprey LLC | yes |
| `eco` | BUSL 1.1 | Osprey LLC | yes |
| `dxp-init` (Marlin-DXP) | BUSL 1.1 | Osprey LLC | yes |
| `niji` | MIT | Osprey LLC | yes |
| `devx-control-plane` | GPL v3 + commercial | Osprey LLC | yes |
| `cockpit` | None | — | deferred — early stage |
| `doc-vault-plane` | None | — | deferred — scaffold |
| `lasso` | None | — | deferred — early stage |
| `arche`, `elan`, `kinjuu` | None | — | deferred — pre-commercial |

---

## Remaining items

- [ ] IP assignment document: personal name → Osprey Strategic Holdings LLC (all repos)
- [ ] Decide `devx-control-plane` dual license → also apply to `devx-toolkit` variants?
- [ ] Revisit `cockpit`, `lasso`, `arche`, `elan`, `kinjuu` at commercialization
- [ ] Add Apache 2.0 to `governance-commons-sdk` (open SDK, should match GC standard)
