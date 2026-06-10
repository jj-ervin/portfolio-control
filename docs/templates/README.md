# Planning Templates

Standard templates for project planning in a DCP portfolio. See `docs/planning-normalization.md` for the full standard.

| Template | Use for |
|----------|---------|
| `DEV-PLAN.template.md` | Current execution plan — active milestones, release targets, blockers |
| `DEV-PATH.template.md` | Historical path — phase history, decisions, task registry |
| `TRACKS.template.md` | Parallel workstreams — portfolio overview, dependency map |
| `PROJECT-STATUS.template.md` | Minimum plan for scaffold or small projects |

## Which template to use

- **Active project with parallel workstreams** → all three: DEV-PLAN + DEV-PATH + TRACKS
- **Active project, single workstream** → DEV-PLAN + DEV-PATH
- **Scaffold or small project** → PROJECT-STATUS only
- **Project inheriting direction from a parent track** → no local plan needed; record the pointer in `projects.yaml`
