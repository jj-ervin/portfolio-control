# DEV-PATH — Portfolio Control Plane

**AUTHORITY LEVEL: AL:1**
**Status:** ACTIVE — single authoritative source for DCP development path
**Updated:** 2026-08-12
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
- 2026-07-02 — Marlin Registry validation gate live: commit `98affdb` added the public self-contained manifest/index validation workflow and script, pushed to `origin/main`; GitHub branch protection now requires the `validate` status check in strict mode. The CI deliberately does not check out the private `marlin` source repo, avoiding private-source leakage into public Actions logs.
- 2026-07-02 — Planning-doc identity correction: this repo's inherited DCP-shaped planning docs now have Marlin Registry-specific H1 titles so portfolio planning validation no longer collides with the real DCP/control-plane docs.

## 2026-08-09 - DCP.19 environment reliability contract

Repeated agent sessions were rediscovering missing test tools, selecting stale
global modules, and assuming project devcontainers applied to host-based Codex
or Claude sessions. DevXToolkit exposed the concrete drift: CI and contributor
docs required Pester 6.0.1 while its devcontainer installed Pester 3.4.0, and
the host had no PSScriptAnalyzer.

DCP.19 adds `dev-environment.ps1` as the central portfolio preflight and
optional installer required by DEV-ACCORD.09. Projects declare exact tools in
a machine-readable `.devtools.json`; the DevXToolkit devcontainer, CI, release
workflow, local validation runner, and portfolio preflight now consume that
same contract. The preflight reports all missing tools at once, emits one exact
repair command, installs only declared missing PowerShell modules with
`-Install`, and verifies readiness afterward. The first contract pins
PowerShell >= 7.4.0, Pester 6.0.1, PSScriptAnalyzer 1.25.0, PSResourceGet 1.2.0,
and Git for `devxtoolkit-v1-x`.

### CI follow-up

The DCP manager check exposed a pre-existing undeclared dependency: CI ran the
root `dev-status.ps1` adapter without provisioning its ignored
`governance-commons` tool repository. The workflow now checks out a pinned
governance-commons revision before invoking the adapter, making the remote
environment match the dependency the root command actually requires.

#### Correction after remote verification

The governance-commons repository is private and cannot be fetched with the
DCP repository's scoped Actions token, so the attempted pinned checkout could
not be the durable CI contract. The manager workflow instead syntax-checks the
root adapter and environment script, then exercises `dev-environment.ps1`
against a self-contained contract fixture requiring the runner's PowerShell
and Git. The private delegated status runtime remains a host-provisioned DCP
dependency and is no longer falsely modeled as available to public CI.

## 2026-08-09 - DevXToolkit v1.5.1 release closeout

DevXToolkit v1.5.1 was released from merge commit `c8925ec` after the exact
main-branch commit passed Windows PowerShell 5.1, Windows PowerShell 7, Ubuntu,
macOS, and full-history gitleaks jobs. GitHub release `v1.5.1` and PSGallery
publication completed; an independent fresh `Save-PSResource` import confirmed
version 1.5.1, 20 exported commands, caller-relative tree and structure output
under the active PowerShell location, and no output under the divergent process
working directory. The public registry pin was merged at `2ed247e`; the DCP
gitlinks now record both release surfaces. The unrelated dirty v2 working tree
was intentionally excluded.

## 2026-08-12 - Marlin Doctor hygiene migration

Marlin-owned `INIT.30.06` replaced the portfolio control plane's ad hoc
Cockpit `hygiene` provider with target-scoped Doctor operations. An idempotent
root registration script seeds DEV-DOCS sync/unignore plus repository
visibility list/set operations without hardcoding the catalog into Marlin.
Visibility set now has a real dry-run, and the live Doctor preview produced
evidence while leaving `projects.yaml` unchanged. The obsolete provider source
and installed registration were retired; the three maintenance scripts remain
portfolio-local, consistent with the control-plane boundary.

## 2026-10-05 — DCP.92.00 portfolio recovery and Classic reconciliation (working name; not yet registered)

Recovered the portfolio-root identity from the preserved `96e0594` commit and corrected origin to `jj-ervin/dev`. The accidental Signal Radar root tree and Git metadata were preserved in the recovery evidence before restoration. Child-owned repository files and unfinished local work were retained.

Current project state is grounded in local source and the inspected remote main commits. Signal Radar is the evidence-first event intelligence layer; EdgeLab is the downstream market-edge research/validation lab. EdgeLab begins as documentation scaffolding, with its first hypothesis still unselected.

The root registry now includes Signal Radar and EdgeLab, records Cockpit as active, and follows TBV's later publication record. Project histories and queued ideas remain preserved. The reconciliation evidence records the exact synchronization results, tests, and any remaining blockers. Public publication and runtime proof remain separate from source/documentation recovery.

Recovery receipt: all eight named clean checkouts synchronized; 122 planning pointers resolve; five scoped diffs pass; SDK source edits preserved byte-for-byte. Portfolio-wide governance closure remains blocked by existing bootstrap/planning failures and unchecked release gates. No commit, push, publication, or trading execution occurred. DCP.92.00 remains an OPEN local working contract pending separately scoped governance remediation; see PLAY.jsonl and the saved recovery evidence.


## 2026-10-05 — Local reconciliation receipt

Authorized continuation: Jesse directed "DO IT" for the recommended Governance Commons reconciliation and governance debt work. Changes remain local and uncommitted. Current SDK remote 0.2.0 supersedes the older local working tree as canonical implementation; the unpublished local TypeScript parity/version draft is preserved separately. Agent Matrix examples are aligned with current schemas; the unsupported additional compliance event mapping remains queued. ONS lint whitespace and bootstrap authority pointers are repaired. GC-AUDIT recognizes public-safe stubs, existing local onboarding authority and registry-selected planning owners, with regression tests. Protected histories and queued ideas are retained. No RFC activation gate, release gate, public publication or trading action is completed by this work.

Reconciliation validation receipt (2026-10-05): SDK 219 Python tests and Node checks pass; Matrix nine CI validations and 232 tests pass; ONS validation and lint pass; 13 new authority regression fixtures plus 19 existing fixtures pass with compatible Pester runtimes. SDK draft files and 24 stale generated files are preserved; final wheel/sdist/npm archives exclude unpublished drafts. Bootstrap: zero errors, eight warnings. Planning: two errors, twelve warnings, both errors at protected Kinjuu DEV-PATH header. Registry: 126 pointers resolve. Governed closure remains OPEN; unchecked release gates remain unchecked. No commit or push.

## 2026-10-27 — Separate checkout path resolution

The local control-plane checkout is `C:\dev\portfolio-control`; independent
project repositories remain siblings under `C:\dev` or descendants of its
studio lanes. Registry paths are resolved from the control-plane checkout.
The command wrapper discovers GC-AUDIT from an explicit configured path,
an embedded distribution, or the sibling Governance Commons checkout. The
planning validator accepts an explicit outer portfolio boundary so registered
sibling planning documents can be checked without weakening its default
single-root containment rule.
