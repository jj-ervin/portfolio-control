# Ecosystem Roadmap — Release Credibility First

**Status:** active
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .05/.06/.07
**Date:** 2026-07-21
**Source:** hands-on audit (Claude + Codex, independently reconciled) — see `docs/sessions/2026-07-21-ecosystem-boundary-audit.md`

## Ordering principle

Phases are ordered by dependency, not ambition: each phase closes a gap the
next phase needs solid. eco's reasoning work is placed last on purpose — it
is the highest-risk claim in the ecosystem claims matrix, and the phase
before it is what makes "unvalidated aspiration" provable one way or the
other, rather than argued about.

## Phase 1 — Fix what's already broken

**Gate:** nothing else is worth sequencing on top of a flagship path that
fails today.

- **DCP `init`** — fix so it provisions a working install outside its own
  source repo. Today it self-copies one file and nothing else, then the
  very next command (`dcp validate`) fails because the files it should have
  provisioned were never created.
- **Marlin evidence signing** — wire key generation into the default guided
  setup path so a fresh install produces signed bundles by default, not
  only when a principal key happens to already exist.
- **Governance Commons** — resolve the paused PyPI/npm publish (external
  account setup), or explicitly document clone-first as the currently
  supported install path. Separately, reconcile `DEV-PLAN.md` against
  `releases/gc-v1.2.0.yaml`, which currently disagree on release-readiness
  status.
- **eco-edge** — decide: retire this repo in favor of the monorepo location
  where the shipped PyPI package actually lives, or perform the planned
  standalone extraction. Either way, fix the quickstart, which currently
  disagrees with the shipped package's real API and metadata.

## Phase 2 — Prove the stranger path, per product

**Gate:** a claim only moves up the claims matrix with a hands-on
verification pass, not a documentation update.

- Run install → run → evidence → verify for each repo from a genuinely
  clean environment (a fresh container, not an existing checkout) — the
  same test this audit approximated by hand across all six repos.
- Promote `docs/ecosystem-claims-matrix.md` from a one-time audit artifact
  to a living document, re-verified at each release rather than re-derived
  from scratch.

## Phase 3 — Make composability real, not just designed

**Gate:** only wire an integration once both sides of it are individually
proven (Phase 1 + 2 complete for both).

- Generalize Marlin's package-install path beyond the one proven case
  (niji) to Governance Commons and DevXToolkit as real installable targets.
- Define Lasso's eco integration point, but gate it off / label it
  explicitly "not yet useful" in any UI — wiring an optional integration to
  a stub reasoning engine would be misleading, not additive.

## Phase 4 — eco intelligence, deferred on purpose

**Gate:** replace the reasoning stub with a real mechanism before any claim
above "unvalidated aspiration" is made, publicly or internally. No
positioning update happens before this phase ships verifiable evidence.

- Replace `ReasoningEngine.think()` with actual policy-aware reasoning —
  today it is a two-line echo behind a real-looking gate architecture.
- Replace the stub `PolicyGate`/`SafetyGate` checks, per eco's own code
  comment: "must be replaced before production."

## Phase 5 — Broader expansion

**Gate:** everything above is proven — this phase is pure upside, not
credibility repair.

- Lasso: JetBrains, Visual Studio, terminal hosts.
- Marlin: public "DXP front door" positioning, once Cockpit and the
  installer both warrant it.
- Governance Commons: published, ecosystem-wide distribution.

## Conflict check (Lane .07)

No conflict found between this roadmap and any repo's own DEV-PLAN.md /
DEV-PATH.md. If anything, this roadmap sequences work each repo had already
flagged as open against itself:

- **Marlin** — `DEV-PLAN.md` already insists "Cockpit hosts Marlin UX as one
  provider surface," not "Cockpit is Marlin's UI," pushing back on the
  front-door framing from inside its own docs.
- **Governance Commons** — `DEV-PATH.md`'s own Product Context already
  admits "a standard without an implementation... harder to adopt for solo
  developers."
- **DevXToolkit** — `DEV-PATH.md`'s own gap analysis already says the core
  value prop is "not yet proven outside author's machine"; `DEV-RELEASE.md`
  already defines done as "a stranger has actually closed" the install/run
  gap.
- **eco** — Architecture Decision AD-3 already states "no production claims
  before SEC.00"; this roadmap makes that gate explicit for the reasoning
  claim specifically.

This roadmap does not create a second ecosystem narrative. It is a
sequencing of gaps each repo had already recorded against itself,
reconciled into one cross-repo order.
