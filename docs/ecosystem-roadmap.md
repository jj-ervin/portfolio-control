# Ecosystem Roadmap — Release Credibility First

**Status:** active
**Produced by:** ECOSYSTEM-BOUNDARY.00, Lane .05/.06/.07
**Date:** 2026-07-21
**Updated:** 2026-07-23
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

**Status: all four items done (2026-07-22).**

- ~~**DCP `init`**~~ — DONE. `dxp-org/devx-control-plane` commit `1cbf570`:
  `init` now fails loudly instead of silently succeeding with nothing
  provisioned when relocated; `validate` now actually checks the given
  target (two bundled validator scripts were stale, missing `-TargetPath`
  entirely).
- ~~**Marlin evidence signing**~~ — DONE. `marlin` commit `5e8d27c`:
  `status --evidence` now resolves and uses a real signing key when one
  exists (it never did before, regardless of guided setup already
  offering key generation) — shares the same signing logic `audit` already
  had instead of duplicating it.
- ~~**Governance Commons**~~ — DONE (the reconcilable part). `governance-commons`
  commit `2a69669`: `DEV-PLAN.md` corrected to match
  `releases/gc-v1.2.0.yaml` (`status: ready` since 2026-06-17, not
  "planned"). The PyPI/npm publish itself (GC-5-F-02/03) remains genuinely
  open — external OIDC/NPM_TOKEN account setup, not a doc or code fix.
- ~~**eco-edge**~~ — DONE (repo kept, not retired, per explicit product-owner
  direction). `eco` commit `2c276e6`: `pip install eco-edge` had never
  actually worked on either published version (0.1.0, 0.1.1) — verified by
  installing both fresh; `import eco.core.edge.kernel` failed immediately
  on a broken `eco/__init__.py` force-include, two undeclared dependencies
  (`ulid`, `numpy`), and a missing `eco.core.context.time_loc` file. Fixed
  all three, deleted a stale duplicate source copy (`packages/src/`), and
  rewrote `docs/edge/quickstart.md` — every constructor call in it
  mismatched the real API, and the CAPS pack it ran against didn't exist
  anywhere in the codebase. Version bumped 0.1.1 → 0.1.2; actually
  publishing to PyPI remains a manual step (maintainer credentials).
  `eco-edge-dgx` stays correctly empty, deferred behind eco-edge v0.1's
  full governance proof path (itself blocked on the same GC publish gate
  above).

## Phase 2 — Prove the stranger path, per product

**Gate:** a claim only moves up the claims matrix with a hands-on
verification pass, not a documentation update.

- Run install → run → evidence → verify for each repo from a genuinely
  clean environment (a fresh container, not an existing checkout) — the
  same test this audit approximated by hand across all six repos.
- Promote `docs/ecosystem-claims-matrix.md` from a one-time audit artifact
  to a living document, re-verified at each release rather than re-derived
  from scratch.

## Phase 3 — Prove the first product wedge, then compose

**Product gate:** Lasso's first commercial proof must demonstrate value beyond
opening Claude, Codex, or other agent tabs separately.

"Governed" in this phase means explicit human approval plus recorded evidence.
It does not mean GC policy enforcement, compliance certification, or eco's
still-stub policy engine.

- Build the first new connector around GitHub pull-request context and
  controlled result publishing.
- One human gives the same typed PR context to several agents with distinct
  review perspectives.
- Lasso compares and synthesizes findings, preserves attribution, and requires
  explicit approval before proposed changes or published results.
- Preserve the decision, artifact history, unresolved questions, and
  agent-to-agent handoff state.

**Acceptance gate:** the workflow must reduce repeated context transfer,
surface findings a single-agent workflow missed, support traceable
agent-to-agent handoff, move safely from recommendation to approved action,
and leave independently understandable evidence. If it cannot demonstrate
those outcomes, it is only a more convenient tab switcher and does not pass
this phase.

**Composition gate:** only wire an integration once both sides are
individually proven (Phase 1 + 2 complete for both).

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
- Lasso multi-human collaboration: asynchronous sharing and comments first;
  identity, presence, per-teammate permissions, and real-time concurrent state
  later.
- Cockpit: prove integration value across independently useful Lasso and
  DevXToolkit surfaces without re-wrapping or owning either product.
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

## Attribution

- Strategy and positioning synthesis: ChatGPT and Claude.
- Six-repo hands-on audit and evidence reconciliation: Claude and Codex.
- Follow-up implementation and local verification: recorded in the cited
  product commits; not attributed to Codex.

This roadmap does not create a second ecosystem narrative. It is a
sequencing of gaps each repo had already recorded against itself,
reconciled into one cross-repo order.
