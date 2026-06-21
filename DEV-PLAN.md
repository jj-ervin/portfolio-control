# DEV-PLAN — DevX Control Plane (DCP)

**AUTHORITY LEVEL: AL:1**
**Status:** ACTIVE
**Updated:** 2026-06-06

---

## CANONICAL DOC RULE

`DEV-PLAN.md` owns: current execution state, active milestones, release targets, SKU roadmap.
`DEV-PATH.md` owns: phase history, design decisions, origin story, task registry.

---

## CURRENT POSITION

**Active phase:** Phase 5 — Growth
**Current version:** v1.0.0 (Studio — all modules complete)
**Next release target:** v1.1.0 — Cross-platform (Mac/Linux PS7 support)

v1.0.0 is complete. All modules shipped: Core, Governance Kit, Agent Kit, Team Kit, Distribution CLI, Consulting. GitHub template repo is live. Next phase focuses on widening the audience (portability), deepening eco integration, and building toward a product with a real moat (VS Code extension → SaaS → Agent Infrastructure).

---

## RELEASE TARGETS

| Version | Name | Description | Status |
|---------|------|-------------|--------|
| v0.1.0 | Foundation | Boundary doctrine, registry, tooling, templates, dashboard | ✅ Done |
| v0.2.0 | Core Portable | DCP extracted as standalone template; SKU boundaries defined | ✅ Done |
| v0.3.0 | Governance Kit | Governance Kit packaged and documented as separable module | ✅ Done |
| v0.4.0 | Agent Kit | Agent Kit module — task templates, routing patterns | ✅ Done |
| v0.5.0 | Team Kit | Team governance module — shared registry, review routing, team handoff | ✅ Done |
| v1.0.0 | Studio | All modules; onboarding; consulting offering live | ✅ Done |
| v1.1.0 | Cross-Platform | Mac/Linux PS7 support; path normalization; cross-platform test suite | ⬜ Next |
| v1.2.0 | eco Integration | eco registry integration, PASS validation gate, Agent Kit alignment | ⬜ |
| v2.0.0 | VS Code Extension | Portfolio sidebar, inline validation, projects.yaml UI, plan health status | ⬜ |
| v3.0.0 | SaaS | Hosted dashboard, GitHub org auto-discovery, multi-user registry | ⬜ |
| v4.0.0 | Agent Infrastructure | Agent Kit as hosted service — routing tables, audit trails, fleet API | ⬜ |

---

## SKU ROADMAP

DCP is designed as a modular product. Each SKU is independently releaseable.

### DCP Core (free / open source)
**Target:** v0.2.0

The minimum viable DCP. Portable and replicable by any developer.

Includes:
- `projects.yaml` schema and conventions
- `dev-status.ps1` dashboard
- `validate-pointers.ps1` pointer checker
- `protect-sources.ps1` corpus guard
- `DEV-CONTROL-PLANE.md` boundary doctrine
- `README.md`
- `ONBOARDING.md`
- `docs/SKU-BOUNDARIES.md`

**Audience:** Any developer managing 3+ repos who wants a registry-driven portfolio view.

---

### DCP Governance Kit (paid or premium tier)
**Target:** v0.3.0

The planning and normalization layer. Separable from Core.

Includes:
- `docs/templates/` — DEV-PLAN, DEV-PATH, TRACKS, PROJECT-STATUS templates
- `docs/planning-normalization.md` — vocabulary, pointer shape, canonical patterns
- `docs/REVIEW-GRAMMAR.md` — review command verbs for normalization, validation, adversarial audit, meta-audit, tracing, and closure
- `validate-review-grammar.ps1` — lightweight adoption check for review grammar files and agent instruction references
- DEV-PLAN + DEV-PATH conventions
- Planning health tooling (already in dashboard)

**Audience:** Teams with multiple active projects who need consistent planning across repos.

---

### DCP Agent Kit (paid — primary differentiator)
**Target:** v0.4.0

The AI-agent governance layer. This is what separates DCP from generic service catalogs.

Includes:
- Generalised task template set (task-level governance with authority levels)
- Model routing pattern library (which agent/model for which task type)
- Agent onboarding doc template
- Multi-window / multi-agent handoff protocol
- Agent-readable planning doc conventions

**Audience:** Developers running multi-agent workflows who need routing, audit trails, and governance.

---

### DCP Studio (bundled)
**Target:** v1.0.0

All modules. Intended for solo developers or small teams running AI-augmented multi-repo development at scale.

Includes: Core + Governance Kit + Agent Kit + onboarding doc + setup guide.

---

### DCP Consulting (service)
**Target:** v1.0.0

Custom setup, workflow design, and training. Delivered as an engagement.

Deliverables: configured DCP instance, custom `projects.yaml` schema, agent routing table, team onboarding session.

**Audience:** Teams adopting AI-augmented development who want a proven starting point rather than building from scratch.

---

## TRACK PLAN

| Track | Name | Goal | Status | Next |
|-------|------|------|--------|------|
| A | Extraction | DCP Core portable as standalone template repo | ✅ Done | — |
| B | Governance Kit | Planning normalization, templates, and audit workflow packaged | ✅ Done | — |
| C | Agent Kit | Task templates + routing patterns as separable module | ✅ Done | — |
| D | Distribution | GitHub template, scaffold CLI, consulting offering | ✅ Done | — |
| E | Team Kit | Multi-person team governance module | ✅ Done | — |
| F | Portability | Mac/Linux cross-platform scripting support | 🔴 Not started | DCP.50 |
| G | eco Integration | eco registry, PASS gate, Agent Kit ↔ eco PASS alignment | 🔴 Not started | DCP.60 |
| H | VS Code Extension | Portfolio sidebar, inline validation, projects.yaml UI | 🔴 Not started | DCP.70 |
| I | SaaS | Hosted dashboard, GitHub auto-discovery, multi-user | 🔴 Not started | DCP.80 |
| J | Agent Infrastructure | Agent Kit as hosted service — routing, audit trail, fleet API | 🔴 Not started | DCP.90 |

---

## PRIORITY WORK ITEMS

| ID | Task | Track | Priority | Status |
|----|------|-------|----------|--------|
| DCP.10 | Extract DCP into standalone template repo | A | P0 | ✅ |
| DCP.11 | Define SKU boundaries (what is Core vs Kit vs Studio) | A | P0 | ✅ |
| DCP.12 | Write user onboarding doc (non-agent audience) | B | P1 | ✅ |
| DCP.13 | Write consulting pitch one-pager | B | P1 | ✅ |
| DCP.14 | Package Governance Kit overview | B | P0 | ✅ |
| DCP.15 | Add planning audit checklist | B | P0 | ✅ |
| DCP.16 | Run adversarial normalization audit | B | P0 | ✅ |
| DCP.17 | Add review grammar command reference | B | P0 | ✅ |
| DCP.18 | Add review grammar validator support | B | P0 | ✅ |
| DCP.20 | Agent Kit — generalise task template set | C | P2 | ✅ |
| DCP.21 | Agent Kit — write routing pattern library | C | P2 | ✅ |
| DCP.30 | Create GitHub template repository | D | P2 | ✅ |
| DCP.31 | Scaffold CLI (dcp.ps1 — init, status, validate) | D | P2 | ✅ |
| DCP.32 | Consulting offering definition | D | P2 | ✅ |
| DCP.40 | Team Kit — shared registry and domain ownership conventions | E | P3 | ✅ |
| DCP.41 | Team Kit — role-based review routing and PR governance | E | P3 | ✅ |
| DCP.42 | Team Kit — team onboarding and shift handoff templates | E | P3 | ✅ |
| DCP.50 | Cross-platform path normalization (remove hardcoded `\`) | F | P1 | ⬜ |
| DCP.51 | Validate all scripts on PS7 Mac/Linux | F | P1 | ⬜ |
| DCP.52 | Update ONBOARDING.md with cross-platform setup instructions | F | P2 | ⬜ |
| DCP.60 | eco registry integration — `.eco` reads `projects.yaml` schema | G | P2 | ⬜ |
| DCP.61 | PASS validation gate — `validate-pointers.ps1` as eco governance check | G | P2 | ⬜ |
| DCP.62 | Agent Kit ↔ eco PASS formal alignment (task IDs ↔ PASS entries) | G | P2 | ⬜ |
| DCP.70 | VS Code extension scaffold — portfolio dashboard sidebar panel | H | P2 | ⬜ |
| DCP.71 | Inline pointer validation on save | H | P2 | ⬜ |
| DCP.72 | projects.yaml UI — add/edit repos, change status | H | P3 | ⬜ |
| DCP.73 | Plan health status bar item per project | H | P3 | ⬜ |
| DCP.80 | GitHub org integration — auto-discover repos into registry | I | P3 | ⬜ |
| DCP.81 | Hosted dashboard — browser-based dev-status | I | P3 | ⬜ |
| DCP.82 | Multi-user registry and team role management | I | P3 | ⬜ |
| DCP.90 | Agent Kit as hosted service — routing tables and audit trails via API | J | P3 | ⬜ |
| DCP.91 | agent-team-protocol integration — fleet governance API | J | P3 | ⬜ |

---

## RECENTLY COMPLETED (Phase 0)

- DCP.00 — Boundary doctrine (`DEV-CONTROL-PLANE.md`)
- DCP.01 — Source corpus protection (pre-commit hook)
- DCP.02 — Planning pointer validator (58 pointers clean)
- DCP.03 — Dashboard status + plan health columns
- DCP.04 — Planning template kit (4 templates)
- DCP.05 — Registry audit and normalization (`projects.yaml`)
- DCP.06 — README + `--help` + DEV-PLAN + DEV-PATH

## RECENTLY COMPLETED (Phase 1)

- DCP.10 — Extracted DCP Core into this standalone template repo
- DCP.11 — Defined Core / Governance Kit / Agent Kit / Studio / Consulting boundaries
- DCP.12 — Added user onboarding doc for self-service setup
- DCP.13 — Added consulting pitch one-pager

## RECENTLY COMPLETED (Phase 2)

- DCP.14 — Added Governance Kit package overview
- DCP.15 — Added planning audit checklist
- DCP.16 — Ran adversarial normalization audit and recorded findings
- DCP.17 — Added `docs/REVIEW-GRAMMAR.md` as the local command grammar for normalize, validate, verify, trace, adversarial audit, meta-audit, and close-the-loop sessions
- DCP.18 — Added `validate-review-grammar.ps1` and wired `dcp.ps1 validate` to check review grammar adoption

## RECENTLY COMPLETED (Phase 3)

- DCP.20 — Agent Kit: task template, cluster header pattern, authority levels, naming conventions
- DCP.21 — Agent Kit: routing patterns, escalation levels, cost discipline, agent onboarding template, handoff protocol

---

## MARKET POSITION

**Problem:** AI-agent-assisted development is chaotic at scale. No standard tooling exists for governing multi-agent workflows across multi-repo portfolios.

**Solution:** DCP — a typed, registry-driven control plane with first-class agent governance. Borrows from enterprise service catalog patterns (Backstage) and applies them at individual and studio scale.

**Differentiation:**
- Agent Kit is the only module in this space addressing agent routing, authority levels, and audit trails at task granularity
- Boundary doctrine prevents the common failure mode of conflating governance, standards, execution, and runtime
- Modular — you can adopt any single layer without buying into the full stack

**Adjacent tools:** Backstage (enterprise only, no agent layer), Linear (project execution only), Notion (no integrity enforcement), GitHub Projects (no cross-repo registry, no agent support).

**Target customers:**
1. Solo developers running 3+ repos with AI agents
2. Small teams (2–8 people) adopting AI-augmented development
3. Studios and consultancies building AI-assisted products
