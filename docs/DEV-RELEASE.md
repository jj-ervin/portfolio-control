# DEV-RELEASE — Portfolio Master

Status: **Stub — structure only, not yet populated**  
Created: 2026-06-09  
Authority: **Portfolio-level coordination document.** This is the master release plan for the `c:\dev` ecosystem. It owns cross-repo sequencing, release dependencies, and the priority order. Individual repo DEV-RELEASE.md files own their own deliverables, admission criteria, and changelogs — they defer to this document for sequencing.

---

## Relationship to Other Planning Docs

| Doc | Owns |
| --- | --- |
| `DEV-PLAN.md` (per repo) | What we are building and in what order |
| `DEV-PATH.md` (per repo) | What we have built and the decisions made |
| `DEV-RELEASE.md` (per repo) | What ships from this repo, when, and under what conditions |
| **`docs/DEV-RELEASE.md` (this file)** | Cross-repo sequencing, release dependencies, priority order |
| `docs/project-direction-inventory.md` | Manager-level map of all planning sources |

A release plan is not a roadmap. It is a commitment surface — the set of deliverables that can be named, sequenced, and validated against gap closure criteria.

---

## Repo DEV-RELEASE Files

| Repo | File | Status |
| --- | --- | --- |
| eco | [`eco/DEV-RELEASE.md`](../eco/DEV-RELEASE.md) | stub |
| governance-commons | [`governance-commons/DEV-RELEASE.md`](../governance-commons/DEV-RELEASE.md) | stub |
| dxp-org | [`dxp-org/DEV-RELEASE.md`](../dxp-org/DEV-RELEASE.md) | stub |
| eco-edge | [`eco-edge/DEV-RELEASE.md`](../eco-edge/DEV-RELEASE.md) | stub |

Repos not listed here either inherit their release gates from eco (eos, cockpit, eco.vs) or are not yet in active release scope.

---

## Release Dependency Graph

```
governance-commons  ──────────────────────────────────────┐
  └─ PyPI/npm published                                    │
  └─ SLSA/SBOM shipped                                     │
  └─ gc-conformance-suite packaged                         │
                                                           ▼
dxp-org             ──────────────────────┐          eco (production)
  └─ .governance installer stranger-test  │            └─ SEC.00 closed
  └─ GC artifacts provisionable           │            └─ RT.10 / NEHI.02 closed
                                          │            └─ Unified trust envelope
                                          ▼            └─ ADM transparency schema
                                   eco-edge (proof surface)
                                     └─ MCP → eco → OTel → PASS path
                                     └─ Signed evidence bundle
                                     └─ Conformance report
```

**Rule:** governance-commons release mechanics must be shipped before eco or eco-edge can make standards compliance claims. eco-edge proof path must be demonstrated before eco makes production positioning claims.

---

## Priority Order (from combined Claude + ChatGPT synthesis, 2026-06-09)

> Source: `docs/sessions/2026-06-09-combined-synthesis.md`

### Step 1 — governance-commons release mechanics
*Ship the public release before adding Pass6 features.*

Owner: governance-commons  
Blocks: eco standards compliance claims, eco-edge conformance reporting  
Key deliverables: PyPI, npm, SLSA, SBOM, gc-conformance-suite, operational runbooks

### Step 2 — eco-edge proof surface
*One complete, traceable, end-to-end path.*

Owner: eco-edge (requires eco + governance-commons)  
Blocks: eco production positioning  
Key deliverable: MCP tool call → eco governance → CloudEvent/OTel trace → PASS record → signed evidence bundle → conformance report

### Step 3 — dxp-org stranger test
*Prove the governance bootstrapping loop outside the author's machine.*

Owner: dxp-org (requires governance-commons PyPI/npm)  
Key deliverables: automated readiness script, installer test suite, stranger-proof README

### Step 4 — eco production gates
*Close production blockers before any production positioning claim.*

Owner: eco  
Key deliverables: SEC.00, RT.10, NEHI.02, unified trust/envelope model, ADM transparency schema stub, operational readiness checklist, RELEASE-PLAN admission gates

### Step 5 — ahead-of-curve (Phase 2)
*After Steps 1-4 are release-complete.*

Owners: eco + governance-commons  
Key deliverables: governance diff + audit replay (eco Q12), constitutional governance layer (governance-commons Q12), federated trust, temporal governance

---

## Cross-Repo Admission Gate Template

When a cross-repo dependency exists, document it explicitly here:

```
### Gate: [downstream-repo] requires [upstream-repo] to have shipped [X]

Upstream: [repo]
Deliverable: [what must be shipped]
Downstream: [repo]
Claim unlocked: [what the downstream repo can now assert]
Verified by: [how to check — package version, CI badge, test pass]
```

---

## Shared Release Entry Format

Each repo DEV-RELEASE.md uses this format for individual releases:

```markdown
## Release vX.Y.Z — [Name]

Target date: YYYY-MM-DD
Status: planned | in_progress | blocked | done
Blocked by: [cross-repo gate, if any]

### What ships
- ...

### Gap closures (reference docs/gap-analysis-framework.md)
- Q1 Regulatory: ...
- Q2 Standards: ...
- Q5 Security: ...

### Admission criteria (every item must be true before release ships)
- [ ] Mechanism exists (not just a document)
- [ ] Mechanism is tested (a test would fail if it broke)
- [ ] Mechanism is observable (governance signal emitted when it runs)
- [ ] Mechanism is discoverable (stranger can find and understand it)
- [ ] [repo-specific criteria]

### Deliverables
- [ ] ...
```

---

## Gap Closure Verification Principle

A gap is not closed until all four are true:

1. **Mechanism exists** — not a document saying it should exist; code, schema, or spec that enforces it
2. **Mechanism is tested** — a test exists that would fail if the mechanism broke
3. **Mechanism is observable** — a governance signal (telemetry, audit record, validation output) is emitted when it runs
4. **Mechanism is discoverable** — someone new can find and understand it without insider knowledge

`spec-complete` is not `release-complete`. `release-complete` is not `runtime-complete`.

---

## Related Documents

- [`docs/gap-analysis-framework.md`](gap-analysis-framework.md) — 12-question gap framework + full gap inventory
- [`docs/sessions/2026-06-09-combined-synthesis.md`](sessions/2026-06-09-combined-synthesis.md) — Claude + ChatGPT synthesis (source of priority order)
- [`docs/project-direction-inventory.md`](project-direction-inventory.md) — manager-level map of all planning sources
