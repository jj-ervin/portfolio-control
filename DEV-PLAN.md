# DEV-PLAN — Portfolio Control Plane

**AUTHORITY LEVEL: AL:1**
**Status:** ACTIVE
**Updated:** 2026-08-12

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
| --- | --- | --- | --- |
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
| --- | --- | --- | --- | --- |
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
| --- | --- | --- | --- | --- |
| DCP.10 | Extract DCP into standalone template repo | A | P0 | ✅ |
| DCP.11 | Define SKU boundaries (what is Core vs Kit vs Studio) | A | P0 | ✅ |
| DCP.12 | Write user onboarding doc (non-agent audience) | B | P1 | ✅ |
| DCP.13 | Write consulting pitch one-pager | B | P1 | ✅ |
| DCP.14 | Package Governance Kit overview | B | P0 | ✅ |
| DCP.15 | Add planning audit checklist | B | P0 | ✅ |
| DCP.16 | Run adversarial normalization audit | B | P0 | ✅ |
| DCP.17 | Add review grammar command reference | B | P0 | ✅ |
| DCP.18 | Add review grammar validator support | B | P0 | ✅ |
| DCP.19 | Add project tool contracts and central environment preflight/bootstrap | B | P0 | ✅ |
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

## RECENTLY COMPLETED (Marlin Registry)

- 2026-07-02 — Public registry submission validation is active on `origin/main`.
  The `validate` GitHub Actions check is required by branch protection. The check
  is self-contained in this public repo and does not check out private Marlin
  source.
- 2026-07-02 — Planning doc H1 titles were corrected to identify this repo as
  Marlin Registry so GC-AUDIT planning validation does not collide with DCP docs.

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

## RECENTLY COMPLETED (Marlin Doctor Migration)

- 2026-08-12 — `INIT.30.06` migrated the root portfolio-maintenance scripts
  from the standalone `hygiene` provider into the target-owned Marlin Doctor
  registry. `register-hygiene-doctor-operations.ps1` seeds the operations;
  `set-repo-visibility.ps1 -DryRun` provides a non-mutating preview. Runtime
  Doctor registry/evidence files are ignored by the portfolio control-plane
  repository.

## QUEUED IDEAS

- 2026-08-19 — `vault/`'s `entities` table (osh/hbl/20amp/personal/shared/
  archive — see `vault/dev-docs/VAULT-SCHEMA-002.md`) is portfolio-wide
  ownership/security-boundary vocabulary, but no project in `projects.yaml`
  currently declares which business entity owns it. Consider whether
  `projects.yaml` should eventually reference vault's entity slugs (or a
  promoted GC-level equivalent) instead of leaving ownership implicit in
  free-text descriptions. Not urgent — flag only, no action taken.
- 2026-08-19 — `vault/assets` (SQLite) and `projects.yaml`'s `projects:`
  list are both "things we build/maintain" registries with real conceptual
  overlap (same repos could appear in both, under different slugs). No
  naming collision found in governance-commons as of this date, but the two
  registries could drift if vault's asset slugs aren't kept aligned with
  `projects.yaml` `name:` values. Worth a deliberate reconciliation pass
  once vault's asset inventory has real entries, not before.
- 2026-08-19 — `vault/` is unlisted in `governance-commons/passes/dev-accord/
  DEV-ACCORD.03.md`'s ecosystem overview table. That's a governance-commons
  PASS document requiring the full DEV-ACCORD.06 change playbook to edit —
  out of scope for a same-session fix. Flag for a future PASS.
- 2026-08-19 — Cockpit/Marlin/vault integration: scoping "could Cockpit host
  vault + KeePassXC safely" surfaced four separate threads, none actioned
  this session, each needing its own future conversation:
  1. **Cockpit provider-executable tamper-detection gap.** Cockpit's
     `ProviderRegistry.register()` cannot detect a provider executable
     swapped after Marlin's install — `package_digest` only covers the
     pre-extraction archive, not the extracted executable. Already tracked
     as an explicit open gap in `cockpit/DEV-PLAN.md` (CKP.17.00 closure,
     deliberately out of that PASS's scope), with a known closure path
     (Marlin would need to attest a digest of the extracted executable — a
     new attestation-schema field). Recommend Cockpit closes this, or
     records a deliberate accept-the-risk decision, before taking on any
     new provider — more providers means more surface resting on the same
     unclosed gap.
  2. **Portfolio sequencing for a Cockpit-hosted vault CLI/GUI.** Preferred
     order: `devxtoolkit-v2-x` (currently `status: scaffold` per
     `projects.yaml` — a research track, not actively being raced to
     completion) developed first, then Cockpit, then Marlin "if needed,"
     before a vault-style tool becomes usable through both its own CLI and
     Cockpit's GUI. A real prioritization call given Marlin/Cockpit already
     have substantial in-flight work of their own (MarlinSetup bootstrap,
     Doctor INIT.30.xx, the gap in item 1) — not something to decide as a
     side effect of a vault feature request.
  3. **`vault` itself stays private, personal, name likely unchanged.** No
     public release, no public-facing "vault" brand.
  4. **New product concept: a distributable "structured local registry +
     external secret-store" template/pattern.** If the SQLite-registry +
     KeePassXC-style hybrid can work safely as a Cockpit provider (own CLI
     as implementation authority, Cockpit as GUI host, secrets never
     touched by any agent or by Cockpit's rendering layer), that pattern
     is generalizable beyond vault's specific schema and could become its
     own distributable template/app later. Needs its own name — collides
     with `dxp-org/doc-vault-plane`'s existing namespace otherwise, and
     vault's own name shouldn't become a public brand per item 3.
     Explicitly downstream of items 1 and 2, not a parallel track to start
     now.

  Also: this thread is concrete counter-evidence against advice received
  elsewhere that an agent cannot safely work with both a SQLite database
  and a KeePassXC-style secret store in the same workflow. This session
  built a full CRUD registry, a KeePassXC-boundary reconciliation tool, and
  survived an independent adversarial review (one real exploit found and
  fixed) — all while the agent never touched a password or `.kdbx` file,
  via strict separation (agent handles SQLite/CLI/logic; the human runs
  every password-touching command in their own terminal). Cockpit's own
  real, tested provider architecture independently arrived at the same
  separation (a formal `secrets` capability with host-managed injection
  that never reaches requests, results, or logs) — validating the pattern
  independently of this session.
- 2026-08-19 — Scoping follow-up to queued-idea item 4 above (distributable
  local-registry + external-secret-store template): a same-day scoping
  conversation separated two things that had been bundled together. Vault's
  actual pattern (SQLite reference registry + KeePassXC, CLI-mediated,
  human-only secret-touching) is a standalone pattern requiring no host.
  Cockpit's `secrets` capability (`cockpit/docs/specifications/
  cockpit-provider-v1.md`) solves a different problem — runtime secret
  injection into a running provider process, not durable reference
  storage. Conclusion: item 4's downstream dependency on items 1 (Cockpit
  provider-attestation gap) and 2 (portfolio sequencing) applies only to a
  future *Cockpit-hosted* version of this product, not to a standalone
  template/CLI extraction, which can proceed independently of both.
  Decision: v1 ships standalone-only (own CLI, no Cockpit dependency),
  matching the precedent already set for Lasso (must work standalone
  before any eco integration; integration is additive, never required).
  A later version may add Cockpit display/integration as a non-breaking
  bump once items 1 and 2 actually clear. Recommendation, not yet
  actioned: treat this as a template extraction from vault's schema/CLI
  rather than a new product initiative with its own `MARKET.md`/`DIST.md`
  — the schema is already generic (`entities` is a data table, not a
  hardcoded enum, so there's no Osprey-specific structure to remove, only
  seed data and dev-docs), but positioning/naming/distribution work
  should wait for a second real consumer of the template. Still needs its
  own name — "vault" is unavailable both as a personal-brand rule
  (`ADR-026` in `vault/dev-docs/VAULT-DECISIONS-001.md`) and because it
  collides with HashiCorp Vault, not just `dxp-org/doc-vault-plane`. No
  implementation work started; this is a scoping record only.
- 2026-08-19 — Naming, location, and feature scoping locked for the queued
  template product above (still no repo created, no implementation
  started — scoping record only):
  - **Name: Cairn.** A cairn is a trail marker (stacked stones) that
    points to a location without being what it marks — matches the
    reference-vs-secret relationship between the registry and KeePassXC.
  - **Location: root `apps` group, standalone** — not `dxp-org/`. Decided
    against tying it to the DevXToolkit brand: nothing in Cairn's design
    actually depends on DevXToolkit tooling, standalone is easier to
    maintain and release independently, and DevXToolkit's own pitch
    (governed multi-agent portfolio development) requires buy-in to a
    category before it means anything to someone, where Cairn's pitch —
    track credentials without handing them to a cloud vendor — is legible
    in one sentence to a much broader audience. Open risk to have a sharp
    answer for before marketing: "why not just use folders/tags in my
    existing password manager" — the answer is real relational structure
    (asset/environment/account binding, full audit history, staleness
    tracking), not something the name communicates on its own.
  - **Feature adoption from Doppler / Infisical / Bitwarden Secrets
    Manager, reviewed deliberately:**
    - Already converges, no new work needed: environment-scoped secrets
      (`secret_refs.environment`), one secret referenced by multiple
      bindings, full audit history via triggers, staleness tracking
      (`secrets list --stale-days`) — vault's schema independently
      arrived at the same structural primitives those tools center on.
    - Worth adopting, targeted for v1.x/v2 (not the initial extraction):
      runtime injection (`cairn run -- <command>`, pulling a live value
      and injecting it into a child process's env without writing to
      disk). Compatible with the existing trust model as long as it stays
      strictly human-invoked — the invariant is "no agent touches secret
      values," not "no CLI command ever does."
    - Explicitly rejected: dynamic/short-lived credential issuance and
      multi-user RBAC/service accounts. Both would turn Cairn into a
      hosted, higher-trust authority competing with Vault/Doppler on
      their own terms, requiring a server component and a much heavier
      security bar — breaks the core pitch that nobody has to trust Cairn
      with live secret material.
  - **Positioning: no governance-philosophy framing.** Cairn should not
    be marketed with DevXToolkit/GC-style governance vocabulary — that's
    a different audience that has to buy into a framework first. The
    underlying discipline (plan before generate, human approves before
    anything applies, full audit trail, agent never touches secret
    values) stays as engineering rigor, just not exposed to customers as
    "governance."
  - **New feature, requested this session: agent-assisted schema design.**
    Bring-your-own LLM (Claude, GPT, Gemini, or local Ollama) helps a
    user design their registry's structure — entities, tables, columns,
    normalization — for their specific project/client needs, while never
    receiving secret values. This productizes the exact workflow already
    used to build vault itself (agent proposed schema, human approved,
    agent built migrations/CLI, agent never touched a secret). Scoped for
    v1.x/v2, not the initial extraction, with three conditions carried
    forward from vault's own `AGENTS.md` role model and `ADR-003`'s
    Plan → Generate → Audit → Approve → Record boundary: (1) the
    boundary must be structural — the agent-facing code path must be
    physically unable to read `secret_refs` values or reach KeePassXC,
    not merely instructed not to; (2) agent-proposed schema changes
    require explicit human approval before applying, never autonomous;
    (3) Cairn should not become a keeper of its own provider API keys —
    read them from an env var at call time rather than storing them, and
    default to local Ollama where a shared secret with a cloud LLM
    vendor isn't wanted at all.
- 2026-08-19 — Cairn v0.1 template extraction completed and pushed. User
  had already created the `jj-ervin/cairn` GitHub repo and a local
  `c:\dev\cairn` directory; extraction proceeded from vault's schema/CLI
  per the scoping above. Schema (3 migrations, no seed data), CLI
  (`scripts/cairn_cli.py`), backup/recovery (`scripts/cairn_backup.py`,
  carrying the path-traversal hardening from vault's adversarial review),
  secret-pattern scan, reconciliation tool, `AGENTS.md` role model
  (Cairn Owner/Agent/Operator/Auditor), `DEV-PATH.md`, `DEV-PLAN.md`, and
  `dev-docs/README.md` (provenance record — what carried over from vault
  and what changed) are in place. All 33 tests pass. Own git repo
  initialized at `c:\dev\cairn`, committed, and pushed to `origin/main`
  with the user's explicit go-ahead. Registered in `projects.yaml`
  (`apps` group, `successor_to: vault`). Still open: v1.x/v2 features
  (`cairn run`, agent-assisted schema design) not started; no
  `MARKET.md`/`DIST.md`; Cockpit integration remains gated on the two
  items noted above. See `cairn/DEV-PLAN.md` for the project's own
  active work queue going forward — this portfolio-level entry will not
  be updated further as Cairn's own planning docs now own that.
- 2026-08-20 — Cockpit platform-boundary work (see
  `cockpit/docs/specifications/cockpit-platform-boundary.md` and
  `cockpit/DEV-PLAN.md`'s cross-reference) named four integration modes
  and found mode 4 ("simple provider," no governance stack) has only a
  partial, unproven occupant: Niji's `CockpitAdapter`
  (`cockpit/src/cockpit/adapters/niji.py`) is real and wired into
  `host-web`'s snapshot builder, but its own test suite exercises a
  `FakeNijiAdapter`, never the real `niji` package — so mode 4 is not
  actually proven live the way mode-1/3 (Marlin's audit chain) is.
  **User named this as the priority Cockpit work immediately after Cairn
  v1.5 closes** (per the priority sequencing in
  `governance-commons`-adjacent memory / `project_cockpit_priority_shift_
  20260820`) — explicitly not to be started before then. Scope agreed:
  wire Cockpit to Niji's real installed/package/provider path (no
  `FakeNijiAdapter` anywhere in the proof path); expose a small
  read-only or low-risk action surface; render real palette/provider
  data in Cockpit; prove discover → display/action → artifact/export if
  Niji's real package supports export; keep Niji provider-owned with
  Cockpit only owning host/render/trust chrome; explicitly do **not**
  build toward mode 2 (Cockpit-derived standalone app) as part of this
  — that stays a separate, later, unproven gap. Acceptance: no
  `FakeNijiAdapter` in the proof path; a demo note a stranger could read
  that says plainly "this is not governance, this is a normal
  creative/tool provider"; a real test or smoke proof that Cockpit loads
  the real Niji provider and renders useful data; docs updated only
  enough to mark mode 4 proven, not to claim mode 2 is proven too.
  Rationale for going first: mode 4 is cheap and closes an already-named
  admitted gap; mode 2 is strategically more interesting but needs a
  real provider/app underneath it first or it becomes fog again.
- 2026-08-21 — **Cockpit provider-executable integrity gap closed, after
  an independent Codex review caught three real gaps in the first pass**
  (item 1 of the 2026-08-19 Cockpit/Marlin/vault scoping entry above).
  User's stated goal — "Cairn installable and with UI and AI" — needs a
  Cockpit-hosted Cairn provider next, and this gap was the named
  precondition before adding any new provider. First pass added an
  `executable_digest` checked once at registration; Codex's review (run
  before anything was committed) found it was checked only at
  registration and not re-verified before each spawn (a TOCTOU window,
  since Cockpit's provider registry is built once and reused for a
  process's lifetime), that inferring the file to hash from "the last
  entry in `args`" was not a sound general contract (breaks on an
  ordinary `script.js --flag` command, and an invalid target crashed
  discovery instead of failing one provider), and that the original
  write-up overstated the claim — the digest is unauthenticated
  (`signature` stays null), so it only catches accidental drift, not a
  fully compromised local write path. All three fixed: Cockpit now
  re-verifies integrity immediately before every provider spawn, not
  just at registration; the digest target is an explicit
  `executable_digest_target` attestation field Marlin declares (never
  inferred positionally), with Marlin enforcing install-root containment
  on it and Cockpit converting a bad target into an ordinary
  registration error instead of crashing; and every description of this
  check now names it correctly as unauthenticated integrity/drift
  detection, with a test recording that limitation explicitly rather
  than letting it pass as "secure." Full detail, code paths, and the
  full adversarial test list: `cockpit/DEV-PLAN.md`'s "Provider-
  Executable Integrity Gap — Closed After Codex Review" entry. Full
  suites green: 184 Cockpit Python tests (1 pre-existing unrelated
  skip), 385 Marlin/marlin-dxp vitest tests. A second Codex pass found
  one more HIGH, non-blocking gap: Marlin's own producer side never
  enforced the same contract it was asking Cockpit to check — an empty/
  non-string `integrityTarget` could reach `resolveVars` unvalidated,
  and `issueProviderAttestation` didn't require the target to actually
  equal `executable`/a declared `args` entry or be a regular file.
  Fixed to mirror Cockpit's consumer check exactly, plus 4 new tests
  (2 parser, 2 installer); full suite re-verified at 389 Marlin/
  marlin-dxp vitest tests, both packages' `tsc --noEmit` clean, both
  repos' `git diff --check` clean. Codex marked this ready to commit.
  Item 2 (portfolio sequencing) is effectively answered by the user's
  own stated priority; item 3 (vault stays private) and item 4 (Cairn as
  the distributable template) already stand. Next queued: build Cairn's
  first Cockpit provider slice — Plan (schema design) and Entry (data
  entry) surfaces only, reusing Cairn's existing safe logic; vault
  mediation and broader AI-in-UI work explicitly deferred to a separate
  checkpoint, per the user's own sequencing.
