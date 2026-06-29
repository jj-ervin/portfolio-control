# Portfolio Deliverability Review — 2026-06-29

**Reviewer:** Jess Ervin (jj-ervin)
**Method:** Manual — Claude Code explore agent read all DEV-PLAN files
**Template:** governance-commons/review-templates/deliverable-review.md v0.1
**Scope:** All active/wip projects in projects.yaml

---

## Top 10 Most Deliverable

| Rank | Project | % Complete | Next action | Next blocker |
| --- | --- | --- | --- | --- |
| 1 | Marlin-DXP (`dxp-init`) | ~75% | Cockpit panel integration (CKP.6) | Cockpit scaffold not started |
| 2 | eco | ~65% | SYN-REG-01 ADM transparency schema; eco v3 surface stabilization | eco v3 restructuring; ARCHE integration pending |
| 3 | governance-commons | ~60% | SDK package publication; PASS-6 DVP track | Schema stabilization; no npm publish pipeline |
| 4 | Lasso | ~55% | Agent session UI; multi-agent collaboration surface | eco runtime dependency; eco v3 surfaces |
| 5 | devx-control-plane (DCP) | ~70% | Cross-platform PS7 support (DCP.50) | Mac/Linux test environment |
| 6 | eco-vscode | ~25% | SKU detection; eco diagnostics extension | eco-vs reconciliation with eco/surfaces/vscode |
| 7 | Cockpit | ~30% | CKP.6 Marlin governance panel | eco/arche integration; eco v3 surfaces |
| 8 | DVP (`doc-vault-plane`) | ~10% | DVP.01-02 installer scaffold (PowerShell/Python CLI) | Nothing technical — capacity only |
| 9 | kinjuu | ~30% | Flutter build; obligation tracking MVP | No active capacity allocated |
| 10 | ELAN | ~10% | Formal spec adoption in eco; standalone repo impl | eco v3 surfaces / ARCHE stabilization |

---

## Observations

- **eco is the central blocker.** eco v3 restructuring delays Cockpit, Lasso, eco-vscode, ELAN, and ARCHE.
- **DVP is the easiest unblocked project.** No external dependencies — just needs capacity. CLI can ship in 2-3 sessions.
- **DCP is most complete** but cross-platform (Mac/Linux) work is the gating item for broader adoption.
- **Marlin-DXP Waves 0-4 closed.** The next meaningful milestone is the Cockpit panel — blocked on Cockpit.
- **kinjuu is orphaned from the main dependency tree.** Can be picked up independently any time.

## Recommended focus

1. **eco v3 surfaces** — unblocks 5+ products simultaneously
2. **DVP CLI (DVP.01-DVP.04)** — unblocked, high-value, 2-3 sessions
3. **DCP cross-platform (DCP.50-51)** — unlocks broader adoption of the most complete product
