# Synthesis Incorporation Record — 2026-06-09

**Purpose:** Permanent record of what was incorporated from the 2-agent research synthesis into planning documents. Answers the question: "has the synthesis actually driven the planning docs, or is it just living in session files?"

**Source synthesis files:**
- `docs/sessions/2026-06-09-research-synthesis.md` — Claude synthesis of 102 sources
- `docs/sessions/2026-06-09-combined-synthesis.md` — Combined Claude + ChatGPT synthesis

**Gap analysis framework:** `docs/gap-analysis-framework.md` v1.1

---

## What Was Incorporated and Where

### eco/DEV-RELEASE.md

**Status:** Fully populated 2026-06-09 (was a stub).

Incorporated:
- Complete current state table (spec-complete vs not-yet-built)
- Full "What is NOT yet built" table with synthesis refs (C1-C13, J-gaps) and priority
- Regulatory deadlines table: EU AI Act August 2, 2026; Colorado SB26-189 January 1, 2027; GDPR Article 17
- Anti-patterns section (synthesis Section D — what eco must not become)
- Release v0.x: production gates including SEC.00, RT.10, NEHI.02, ADM schema, trust envelope, SBOM
- Release v1.0: governance-commons integration, CVL, FRC, eco-guardrails.yaml, AIBOM, Resilience Gate, steady-state contracts
- Release v2.0: governance diff + audit replay (Q12 pick), jurisdiction-adaptive policy compiler, metadata maturity gate, economic governance / FinOps, Human-Agent Teaming Protocol, context-specific truth domains, deletion cascade, event-driven execution
- Q12 pick documented: Governance Diff + Audit Replay tied to PASS

### eco/DEV-PLAN.md

**Status:** Synthesis-derived queued work section appended 2026-06-09.

Sections added:
- **SYN-REG-01/02/03** — Regulatory time-bound items: ADM transparency schema (August 2, 2026), jurisdiction-adaptive policy compiler (January 1, 2027), deletion cascade engine (GDPR active)
- **SYN-SEC-01 through 06** — Security gate (SEC.00 scope): Prompt Firewall, network-layer enforcement, unified trust/envelope model, AIBOM, SBOM
- **SYN-GC-01/02/03** — Governance-commons integration: CloudEvents binding, OTel `gc.agent.*` spans, eco-guardrails.yaml
- **SYN-VER-01 through 05** — Verification and resilience: CVL, FRC, Resilience Gate, steady-state contracts, fault injection
- **SYN-CAT-01 through 06** — Category-defining items: governance diff + audit replay, metadata maturity gate, Human-Agent Teaming Protocol, economic governance / FinOps, context-specific truth domains, event-driven execution
- Regulatory deadlines summary table
- Anti-patterns section (synthesis Section D) — 8 patterns documented as non-negotiable constraints

### eco/TRACKS.md

**Status:** Cross-track notes appended 2026-06-09.

Notes added:
- Governance-commons integration as a Track B prerequisite (SYN-GC-01/02/03 in DEV-PLAN)
- eco-edge-dgx prerequisite: SPARK.00 cluster header must be accepted before DGX HAL adapter work begins
- SEC.00 before new Track B capability — non-negotiable anti-pattern constraint

### eco/DEV-RELEASE.md (Step 4 in portfolio priority order)

This file was the last of the four repo DEV-RELEASE files to be populated. See above.

### governance-commons/DEVPLAN.md

**Status:** Synthesis section appended 2026-06-09.

Sections added:
- Regulatory deadlines table (EU AI Act August 2, 2026; Colorado SB26-189 January 1, 2027; GDPR)
- PASS-5 open items not previously in near-term queued work: SLSA (97-G15), conformance certification (101-G6b), global cluster registry (100-N2), TypeScript/Go SDKs (101-G5)
- PASS-6 items from synthesis not previously registered: Human-Agent Teaming Protocol (J2), GDPR/privacy rights compliance mapping, A2A protocol evolution tracking (E5)
- Anti-patterns section (synthesis Section F — what governance-commons must not become)

### dxp-org/DEVPLAN.md

**Status:** Synthesis section appended 2026-06-09.

Sections added:
- **DXP-SYN-G1 through G9** — DCP adoption items: eco.runtime.sovereign, long-running lifecycle management, event-driven execution substrate, steady-state contracts, fault injection, eco.compute.profile, deterministic compiled artifacts (G7 flagged as Phase 1 fix — breaks PASS determinism today), locality-first memory islands, edge/offline governance profile
- Anti-patterns table (synthesis Section H — 6 patterns documented as constraints)
- Regulatory context table for DCP

---

## DEV-RELEASE Files — Populated Status

| Repo | File | Status |
| --- | --- | --- |
| governance-commons | `governance-commons/DEV-RELEASE.md` | Populated 2026-06-09 — PASS-5 active state, v1.2.0/v1.3.0/v2.0.0 release plans |
| eco-edge | `eco-edge/DEV-RELEASE.md` | Populated 2026-06-09 — proof path as primary deliverable; eco-edge-dgx variant |
| dxp-org | `dxp-org/DEV-RELEASE.md` | Populated 2026-06-09 — dotgovernance/DCP/devxtoolkit-v1-x stranger test gates |
| eco | `eco/DEV-RELEASE.md` | Populated 2026-06-09 — production gates, proof path, category definition |
| portfolio master | `docs/DEV-RELEASE.md` | Created 2026-06-09 — cross-repo sequencing, dependency graph, priority order |

---

## What Was NOT Incorporated (and why)

| Item | Reason not incorporated |
| --- | --- |
| DEV-PATH files (any repo) | DEV-PATH owns history and decisions, not future work. Synthesis findings belong in DEV-PLAN (queued work) and DEV-RELEASE (release contracts), not in the historical record. |
| eco/DEV-PATH.md | Same as above. The synthesis does not change what was built; it changes what will be built next. |
| governance-commons/DEVPATH.md | Same as above. PASS history is unchanged. |
| Synthesis items already tracked in GC DEVPLAN gap checklist | Items like 101-AC1 (constitutional governance), 101-AC2 (federated trust), 101-AC3 (temporal authority) were already registered in the gap checklist with PASS assignments. Not duplicated. |
| Regulatory sandbox participation (J10) | Organizational action, not a code or spec item. Not appropriate for a DEV-PLAN. Noted in combined synthesis doc. |
| Operator upskilling as workflow output (J7) | Eco-domain item but highly speculative; deferred to v2.0 roadmap consideration. Noted in eco DEV-RELEASE v2.0 deliverables implicitly via context-specific truth domains. |

---

## Synthesis Coverage Map

The following synthesis sections have been incorporated:

| Synthesis Section | Content | Incorporated In |
| --- | --- | --- |
| A — Dominant Themes | 12 themes validating eco architecture | Combined synthesis doc; DEV-RELEASE current state summaries |
| C1–C13 — What Eco Should Adopt | 13 adoption items | eco/DEV-PLAN.md SYN-* items; eco/DEV-RELEASE.md releases |
| D — What Eco Should Avoid | 8 anti-patterns | eco/DEV-PLAN.md Anti-Patterns; eco/DEV-RELEASE.md Anti-Patterns |
| E1–E13 — What GC Should Adopt | 13 adoption items | GC/DEVPLAN.md SYN-* items; GC/DEV-RELEASE.md (most items already tracked in gap checklist) |
| F — What GC Should Avoid | 6 anti-patterns | GC/DEVPLAN.md Anti-Patterns |
| G1–G9 — What DCP Should Adopt | 9 adoption items | dxp-org/DEVPLAN.md DXP-SYN-G* items |
| H — What DCP Should Avoid | 6 anti-patterns | dxp-org/DEVPLAN.md Anti-Patterns |
| I — Cross-Cutting Structural | 8 recommendations | Distributed across all DEV-RELEASE gap closures and DEV-PLAN queued work |
| J1–J10 — Genuine Gaps | 10 gaps not yet in roadmap | eco/DEV-PLAN.md SYN-CAT/SYN-REG items; GC/DEVPLAN.md SYN-GC items; all DEV-RELEASE v2.0 deliverables |
| Tier 1 — Standards Compliance | ~16 items | eco/DEV-PLAN.md SYN-SEC items; GC/DEVPLAN.md PASS-5 open items |
| Tier 2 — Best Practice | ~20 items | eco/DEV-PLAN.md SYN-VER items; eco/DEV-RELEASE.md v1.0 deliverables |
| Tier 3 — Ahead of Industry | ~12 items | eco/DEV-PLAN.md SYN-CAT items; GC/DEVPLAN.md PASS-6 items; all DEV-RELEASE v2.0 sections |
| 12-Question Framework (Q1–Q12) | Gap analysis framework | `docs/gap-analysis-framework.md` v1.1; referenced in all DEV-RELEASE files |
| Regulatory corrections | EU AI Act August 2, 2026; Colorado SB26-189 January 1, 2027 | Regulatory tables in eco/DEV-PLAN.md, GC/DEVPLAN.md, dxp-org/DEVPLAN.md |

---

## Critical Regulatory Deadlines (do not lose track of these)

| Regulation | Deadline | Action Required | Owner |
| --- | --- | --- | --- |
| EU AI Act — full applicability | **August 2, 2026** | ADM transparency schema stub in eco; GC compliance evidence schema covers `control_frameworks` EU-AI-Act reference | eco (SYN-REG-01), GC (PASS-4 done) |
| Colorado SB26-189 ADMT regime | **January 1, 2027** | Jurisdiction-adaptive policy compiler in eco; GC governance record schema supports ADMT output | eco (SYN-REG-02) |
| GDPR Article 17 right to erasure | Active now | Deletion cascade engine in eco; GDPR mapping in GC | eco (SYN-REG-03), GC (SYN-GC-GDPR) |

---

## Next Actions from Synthesis (priority order)

These map directly to the portfolio DEV-RELEASE priority order but are restated here with synthesis traceability:

1. **governance-commons v1.2.0 release** — LLC filing unblocks GitHub Releases + PyPI/npm. Everything downstream waits for this. (GC DEVPLAN PASS-5 Batch 3/4)
2. **eco SEC.00 + RT.10** — Write and accept these PASSes. No new eco Track B capability before SEC.00. (eco DEV-PLAN SYN-SEC-01 through 06, DP-4-11 series)
3. **ADM transparency schema stub** — EU AI Act August 2, 2026 deadline. Write before that date. (eco DEV-PLAN SYN-REG-01)
4. **eco-edge proof path** — After governance-commons PyPI/npm published; wire CloudEvents/OTel/PASS to GC specs. (eco-edge DEV-RELEASE v0.1)
5. **dxp-org stranger test** — After GC PyPI/npm; dotgovernance installer hardened and tested outside author's machine. (dxp-org DEV-RELEASE v0.1)
6. **DXP-SYN-G7** — Fix compiler timestamp embedding in DCP. Breaks PASS determinism today. Phase 1 fix, not Phase 2. (dxp-org DEVPLAN)
