# Planning Normalization Standard

Updated: 2026-06-06

This standard defines how a DCP portfolio should unify project direction without forcing every repo into the same internal structure.

## Portfolio Source Of Truth

`projects.yaml` owns cross-project facts:

- `name`
- `path`
- `group`
- `description`
- `status`
- `branch`
- relationship keys such as `runtime_of`, `site_for`, `governance_package`, `depends_on`, `publishes_to`
- `planning` pointers

Child repos own their own implementation details and internal docs.

## Planning Pointer Shape

Use these optional keys under each project:

```yaml
planning:
  canonical: path/to/current-plan.md
  path: path/to/dev-path.md
  tracks: path/to/tracks.md
  roadmap: path/to/roadmap.md
  implementation_plan: path/to/implementation-plan.md
  alternate_status: path/to/alternate-status.md
  onboarding: path/to/onboarding.md
  project: path/to/project.yaml
  changelog: path/to/changelog.md
  notes: "Short explanation when direction is inherited, absent, archived, or intentionally deferred."
```

Prefer `canonical` for the current execution plan. Use `path` for history, phase lineage, or longer development path. Use `tracks` when parallel workstreams exist. Use `alternate_status` only when a secondary status surface must remain discoverable. Use `changelog` only as an audit link.

## Canonical Project Planning Pattern

For mature active projects, prefer this triad:

| File Role | Purpose |
| --- | --- |
| Current plan | Current execution state, next milestones, active blockers |
| Development path | Historical phases, major decisions, task lineage |
| Tracks | Parallel workstreams and dependencies |

The file names may vary by repo. The DCP registry records the actual paths.

## Minimum Plan For Small Projects

Small or scaffold projects only need one canonical plan containing:

- current status
- next milestone
- active blockers
- done/deferred notes
- links to changelog or audit files, if any

## Status Vocabulary

Portfolio project status:

- `scaffold`: exists but not actively developed
- `wip`: forming, incomplete, or not yet stable
- `active`: current work target
- `stable`: usable standard/product with maintenance work
- `archive`: retained for history

Task/milestone status:

- `planned`
- `in_progress`
- `blocked`
- `done`
- `deferred`
- `unknown_needs_audit`

## Rules

1. Do not create competing root planning docs with new names when a canonical plan already exists.
2. Do not treat snapshots, templates, generated site output, or worktree copies as authoritative planning.
3. Do not use changelogs as the only current-status surface for active projects.
4. If a project inherits direction from a parent track, say so in `projects.yaml`.
5. If a project has duplicate status docs, choose one canonical file and mark the other as alternate or archive.
6. Keep model routing, live handoff state, and execution traces out of Governance Kit docs unless clearly marked as optional Agent Kit context.
