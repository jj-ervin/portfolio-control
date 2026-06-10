# Project Direction Inventory

Updated: 2026-06-05

This is the `C:\dev` manager-level index of planning, roadmap, track, milestone, and status documents found across the workspace. It does not replace child repo planning docs. It records where direction currently lives so the portfolio can be normalized without moving project files.

## Authority Model

| Level | Meaning | Examples |
| --- | --- | --- |
| Portfolio registry | Cross-project inventory and relationships | `projects.yaml` |
| Portfolio planning index | Manager-level map of planning sources | this file |
| Project canonical plan | Current execution source for one project | `eco/DEV-PLAN.md`, `project-orchestrator-agent/DevPlan-v1.0.md` |
| Project path/history | Phase history, PASS/task lineage, historical path | `eco/DEV-PATH.md`, `kinjuu/dev-path.md` |
| Track/workstream docs | Parallel workstreams or release lanes | `eco/TRACKS.md`, `eco/tracks/TRACK-A.md` |
| Changelog/PASS history | Audit trail, not current direction by default | `passchangelog.md`, `docs/passchangelog/*` |
| Archive/snapshot/template | Non-authoritative unless explicitly restored | `state-snapshots`, `docs/archive`, `templates` |

## Active Planning Sources

| Project | Canonical / Current | Path / Roadmap | Tracks / Milestones | Notes |
| --- | --- | --- | --- | --- |
| eco | `eco/DEV-PLAN.md` | `eco/DEV-PATH.md` | `eco/TRACKS.md`, `eco/tracks/TRACK-A.md` through `TRACK-E.md` | Strongest planning system. Root docs explicitly declare canonical authority. |
| eco-edge | `eco/tracks/TRACK-A.md` | none found in `eco-edge` | Track A | Direction currently inherited from eco Track A. |
| eco-slate | none found | `eco-slate/docs/roadmap.md` | v0.1/v0.2/v1.0 roadmap | Lightweight roadmap only. |
| eco-slate-www | `eco-slate-www/docs/DEV_PLAN.md` | `eco-slate-www/docs/DEV_PATH.md` | migration milestones | Has actionable migration plan. |
| eco.vs | `eco/tracks/TRACK-B.md` | none found in `eco.vs` | Track B | Direction currently inherited from eco platform/SKU track. |
| .eco | none for product direction | `.eco/dev-path.md` | `.eco/passchangelog.md` | Runtime-kernel path only; eco docs warn this is not the product roadmap. |
| eos | `eco/DEV-PLAN.md` by inheritance | none found in `eos` | eco runtime/governance work | No standalone direction doc found. |
| cockpit | `eco/tracks/TRACK-B.md` by inheritance | none found in `cockpit` | Track B | No standalone direction doc found. |
| agent-dossier | none found | `governance-commons/agent-dossier/ROADMAP.md` | v1.1.0 roadmap sections | Focused standard roadmap. |
| agent-dossier-www | `governance-commons/agent-dossier-www/GOVERNANCE_COMMONS_DOMAIN_PLAN.md` | none found | domain/url/deployment plan | Site/domain planning source. |
| agent-matrix | none found | none found | changelog/README only | Needs a canonical status/roadmap if active direction is expected. |
| governance-commons-www | none found | none found | publishing work inferred from repo | Needs a canonical site plan if active direction is expected. |
| governance-commons-sdk | none found | none found | code implementation inferred from repo | Needs a canonical SDK plan if active direction is expected. |
| project-orchestrator-agent | `governance-commons/project-orchestrator-agent/DevPlan-v1.0.md` | `governance-commons/project-orchestrator-agent/DevPath-v1.0.md` | `governance-commons/project-orchestrator-agent/Tracks.md` | Complete plan/path/tracks triad. |
| devxtoolkit-v1-x | `dxp-org/devxtoolkit-v1-x/DEV-PLAN.md` | `dxp-org/devxtoolkit-v1-x/DEV-PATH.md` | release stabilization work | Active v1 implementation and OSS candidate. |
| devxtoolkit-v2-x | `dxp-org/devxtoolkit-v2-x/DEV-PLAN.md` | `dxp-org/devxtoolkit-v2-x/DEV-PATH.md` | Pass6 research track | Scaffold/future track; not a replacement for v1 release stabilization. |
| devx-toolkit | `dxp-org/devx-toolkit/governance/project.yaml` | none found | `dxp-org/devx-toolkit/governance/passchangelog.md` | Historical TypeScript origin for DevXToolkit v1/v2; reference/archive only. |
| kinjuu | none found | `kinjuu/dev-path.md` | `kinjuu/project.yaml`, `kinjuu/passchangelog.md` | Scaffold-level devpath only. |
| niji | `niji/niji_current_status.md` | `niji/niji_dev_path_v0.1_to_v2.0.md` | `niji/niji_implementation_plan_v0.1.md` | Good planning set, but duplicate status exists under `niji/docs/`. |

## Duplicate Or Historical Sources

- `eco/docs/archive/devpath-consolidation/**` preserves pre-consolidation devpath material. Treat as archive.
- `eco/docs/passchangelog/**` contains many PASS history files. Treat as audit trail, not the current plan.
- `.eco/state-snapshots/**` and `eco-slate-www/.eco/state-snapshots/**` are snapshots. Treat as recovery history.
- `.eco/skus/**/.eco/dev-path.md` and `eco-slate-www/.eco/skus/**/.eco/dev-path.md` are package/SKU internals. Treat as package history unless a canonical doc references them.
- `eco/.claude/worktrees/**` contains worktree copies. Treat as ephemeral unless restored by a human.
- `_archive/devtoolkit-legacy-archived/**`, `dxp-org/devx-toolkit/**`, and `lasso_archive/**` are archive/reference group material.

## Gaps To Normalize

1. Projects with no active planning doc: `agent-matrix`, `governance-commons-www`, `eos`, `cockpit`, `eco.vs`, `elan`, `arche`, `powershell`, `tools`.
2. Projects whose direction is inherited from eco tracks rather than owned locally: `eco-edge`, `eco.vs`, `cockpit`, `eos`.
3. Projects with old or scaffold-level planning only: `kinjuu`, `devxtoolkit-v2-x`.
4. Projects with duplicate status/path docs: `niji`.
5. PASS/changelog files are abundant but not consistently connected to project current status.

## Recommended Normalization Order

1. Keep `projects.yaml` as the portfolio source of truth for project identity, status, relationships, and planning pointers.
2. Give each active project one canonical current-plan file or an explicit `planning.notes` inheritance statement in `projects.yaml`.
3. Use a common status vocabulary across plans: `scaffold`, `wip`, `active`, `stable`, `archive`, plus task-level `planned`, `in_progress`, `blocked`, `done`, `deferred`.
4. Treat PASS/changelog as audit history and link it from current plans rather than using it as the current plan.
5. Add or update planning docs only after deciding whether inherited eco track planning is enough for that project.
