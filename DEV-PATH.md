# DEV-PATH — Portfolio Control Plane (c:\dev root)

**AUTHORITY LEVEL: AL:1**
**Status:** ACTIVE — single authoritative source for DCP development path
**Updated:** 2026-06-06
**Supersedes:** N/A — first canonical planning doc for DCP

---

## CANONICAL DOC RULE

`DEV-PATH.md` owns: phase history, design decisions, origin story, and task registry.
`DEV-PLAN.md` owns: current execution state, active milestones, release targets, SKU roadmap.

This file governs the portable DCP template repo as a product.

---

## AGENT ONBOARDING

Before working on DCP as a product, read in order:

1. `DEV-CONTROL-PLANE.md` — boundary doctrine, the core architectural decision
2. `docs/planning-normalization.md` — planning standard (DCP enforces this for others)
3. **This file** — phase history, design rationale
4. `DEV-PLAN.md` — current release targets and work queue
5. `README.md` — user-facing product description

DCP Core components are in this repository. When installed, they may live in a dedicated `devx-control-plane/` folder or directly in a user's portfolio root.

---

## ORIGIN

DCP emerged from a governance session on 2026-06-05/06 during which a local multi-repo portfolio was audited and the following were established in a single working session:

- Boundary doctrine (`DEV-CONTROL-PLANE.md`) — what lives in each layer and why
- Planning normalization standard (`docs/planning-normalization.md`)
- Pre-commit source protection (`protect-sources.ps1`)
- Planning pointer validator (`validate-pointers.ps1`)
- Portfolio dashboard enhancement (`dev-status.ps1` — status + plan health columns)
- Planning template kit (`docs/templates/`)
- Portfolio registry cleanup (`projects.yaml` — 27 pointers verified)

The architectural position (standards / control plane / project repos / runtime) is the stable foundation DCP is built on.

---

## PHASE HISTORY

### Phase 0 — Foundation (2026-06-05 → 2026-06-06) ✅ COMPLETE

**Goal:** Establish the original local workspace as a governed portfolio control plane.

**Key decisions:**
- The portfolio root is a *control plane*, not a monorepo. This distinction prevents it from absorbing execution artifacts.
- Portability rule: reusable standards belong outside the local DCP instance; local workflow and registry conventions belong in DCP.
- Runtime state (live task queues, agent handoffs) must not be committed — it belongs in a workspace or database.
- `project-orchestrator-agent` holds the runtime *contract and schemas*, not live state.

**Completed:**
- DCP.00 — Boundary doctrine written and committed
- DCP.01 — Source corpus protection (pre-commit hook)
- DCP.02 — Planning pointer validator
- DCP.03 — Dashboard status + plan health columns
- DCP.04 — Planning template kit (4 templates)
- DCP.05 — projects.yaml pointer audit and normalization (27 verified)
- DCP.06 — README, --help, DEV-PLAN, DEV-PATH (this file)

---

### Phase 1 — Extraction & Packaging (2026-06-06) ✅ COMPLETE

**Goal:** Make DCP portable — extractable from the original reference workspace and replicable by others.

**Key decisions:**
- DCP Core is the standalone template repo: registry, dashboard, pointer validator, source guard, boundary doctrine, README, onboarding, and SKU boundaries.
- Governance Kit is the separable planning layer: templates, planning normalization, and planning audit conventions.
- Agent Kit is the separable multi-agent workflow layer: task templates, routing patterns, onboarding, handoff protocol, and audit conventions.
- Runtime state remains outside the repo.

**Completed:**
- DCP.10 — Extracted DCP into a standalone template/scaffold repo
- DCP.11 — Defined SKU boundaries in `docs/SKU-BOUNDARIES.md`
- DCP.12 — Wrote DCP onboarding doc for new users
- DCP.13 — Wrote consulting pitch one-pager

---

### Phase 2 — Governance Kit Module (current)

**Goal:** Package the planning and normalization layer as a separable module.

Planned:
- audit `docs/templates/` for generic language
- promote `docs/planning-normalization.md` into Governance Kit docs
- add a planning audit checklist
- add `docs/REVIEW-GRAMMAR.md` as the local command grammar for review, normalization, validation, adversarial audit, meta-audit, tracing, and gap closure
- add `validate-review-grammar.ps1` so DCP/Governance Kit can check review grammar adoption in local and adopted repos
- document how Core users adopt Governance Kit incrementally

---

### Phase 3 — Agent Kit Module (future)

**Goal:** Package the AI-agent-specific layer of DCP as a separable module.

The Agent Kit includes:
- task template set
- Model routing pattern library
- Agent onboarding doc template
- Multi-agent handoff protocol

This is DCP's primary market differentiator. Most competing tools solve the registry/dashboard problem. None solve the agent governance problem.

---

### Phase 4 — Distribution (future)

**Goal:** Make DCP findable, installable, and sellable.

- GitHub template repository
- Optional scaffold CLI (`dcp init`)
- Consulting offering (setup + training + custom config)
- Landing page / product positioning

---

## DESIGN PRINCIPLES

1. **Registry-driven** — `projects.yaml` is the single source of truth. Tools read from it; humans edit it.
2. **Agent-readable** — planning docs follow typed conventions so agents can parse intent without ambiguity.
3. **Boundary-strict** — governance, standards, execution, and runtime are hard-separated layers.
4. **Integrity-enforced** — broken pointers and bulk corpus rewrites are caught at commit time, not discovered later.
5. **Modular** — each component is independently useful. You don't need all of DCP to benefit from any part of it.
6. **No runtime in the repo** — ephemeral agent state does not belong in version control.

---

## TASK REGISTRY

| ID | Name | Status | Phase | Notes |
| --- | --- | --- | --- | --- |
| DCP.00 | Boundary doctrine | done | 0 | `DEV-CONTROL-PLANE.md` |
| DCP.01 | Source corpus protection | done | 0 | `protect-sources.ps1` + pre-commit hook |
| DCP.02 | Pointer validator | done | 0 | `validate-pointers.ps1` |
| DCP.03 | Dashboard status + plan health | done | 0 | `dev-status.ps1` |
| DCP.04 | Planning template kit | done | 0 | `docs/templates/` |
| DCP.05 | Registry audit and normalization | done | 0 | `projects.yaml` |
| DCP.06 | README + --help + planning docs | done | 0 | This file + `DEV-PLAN.md` + `README.md` |
| DCP.10 | Extract into template repo | done | 1 | `devx-control-plane` |
| DCP.11 | SKU boundary definition | done | 1 | `docs/SKU-BOUNDARIES.md` |
| DCP.12 | User onboarding doc | done | 1 | `ONBOARDING.md` |
| DCP.13 | Consulting pitch one-pager | done | 1 | `docs/PITCH.md` |
| DCP.14 | Package Governance Kit overview | done | 2 | `docs/GOVERNANCE-KIT.md` |
| DCP.15 | Planning audit checklist | done | 2 | `docs/PLANNING-AUDIT.md` |
| DCP.16 | Adversarial normalization audit log | done | 2 | `docs/ADVERSARIAL-AUDIT.md` |
| DCP.17 | Review grammar command reference | done | 2 | `docs/REVIEW-GRAMMAR.md`; local-first grammar, future GC promotion only by PASS/RFC |
| DCP.18 | Review grammar validator | done | 2 | `validate-review-grammar.ps1`; `dcp.ps1 validate` runs it after pointer validation |
| DCP.20 | Agent Kit — task template set | done | 3 | `docs/agent-kit/TASK-TEMPLATE.md`, `AGENT-KIT.md`, `AGENT-ONBOARDING.md` |
| DCP.21 | Agent Kit — routing pattern library | done | 3 | `docs/agent-kit/ROUTING-PATTERNS.md`, `HANDOFF-PROTOCOL.md` |
| DCP.30 | GitHub template repo | done | 4 | `devx-control-plane` marked as GitHub template |
| DCP.31 | Scaffold CLI (`dcp init`) | done | 4 | `dcp.ps1` — init, status, validate, help |
| DCP.32 | Consulting offering definition | done | 4 | `docs/CONSULTING.md` |
| DCP.40 | Team Kit — shared registry and domain ownership | done | 5 | `docs/team-kit/TEAM-KIT.md` |
| DCP.41 | Team Kit — role-based review routing and PR governance | done | 5 | `docs/team-kit/REVIEW-ROUTING.md` |
| DCP.42 | Team Kit — team onboarding and shift handoff templates | done | 5 | `docs/team-kit/TEAM-ONBOARDING.md` |
| DCP.50 | Cross-platform path normalization | planned | 6 | Remove hardcoded `\`; use `Join-Path` throughout |
| DCP.51 | PS7 Mac/Linux validation | planned | 6 | Test all scripts on non-Windows PS7 |
| DCP.52 | Cross-platform onboarding | planned | 6 | `ONBOARDING.md` Mac/Linux setup section |
| DCP.60 | eco registry integration | planned | 7 | `.eco` reads `projects.yaml` schema |
| DCP.61 | PASS validation gate | planned | 7 | `validate-pointers.ps1` as eco governance check |
| DCP.62 | Agent Kit ↔ eco PASS alignment | planned | 7 | Task IDs ↔ PASS entries formal link |
| DCP.70 | VS Code extension scaffold | planned | 8 | Portfolio dashboard sidebar |
| DCP.71 | Inline pointer validation | planned | 8 | Validate on save in editor |
| DCP.72 | projects.yaml UI | planned | 8 | Add/edit repos, change status in extension |
| DCP.73 | Plan health status bar | planned | 8 | Per-project plan health in VS Code status bar |
| DCP.80 | GitHub org integration | planned | 9 | Auto-discover repos into hosted registry |
| DCP.81 | Hosted dashboard | planned | 9 | Browser-based dev-status (SaaS) |
| DCP.82 | Multi-user registry | planned | 9 | Team role management in hosted layer |
| DCP.90 | Agent Kit hosted service | planned | 10 | Routing tables + audit trails via API |
| DCP.91 | agent-team-protocol integration | planned | 10 | Fleet governance API |

---

## CHANGELOG

- 2026-06-06 — v1.0.0 Studio complete. All modules shipped. GitHub template live.
- 2026-06-06 — v0.2.0 Core Portable extraction completed.
- 2026-06-21 — Governance correction: recent DCP.17/DCP.18 updates inserted rows into existing `DEV-PATH.md` sections while adding append-only policy. Treat that as a one-time normalization exception; future `DEV-PATH.md` updates should append a changelog entry, phase section, PASS entry, or task row without rewriting existing history.
- 2026-07-01 — Added root adapters and docs for GC-AUDIT preflight and CI invariant validation, plus append-only `PLAY.jsonl` telemetry record shape using read/plan/execute/verify/close categories with `started_at`, `ended_at`, and `duration_ms`.
