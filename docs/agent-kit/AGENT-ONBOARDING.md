# Agent Onboarding Template

Copy this into your project repo as `AGENTS.md` or `docs/AGENT-ONBOARDING.md`.
Fill in the `{{placeholders}}` for your project.

An agent reads this file at the start of every session before touching any code.

---

## Template

```markdown
# {{Project Name}} — Agent Onboarding

Read this before starting any task in this repo.

---

## Read order

Before starting work, read these in order:

1. **This file** — project state, your task, routing
2. `{{DEV-PATH.md}}` — phase history, task registry, invariants
3. `{{DEV-PLAN.md}}` — current milestones and active blockers
4. The cluster header for your work area — `tasks/{{DOMAIN}}.00.md`
5. Your specific task file — `tasks/{{DOMAIN}}.NN.md`
6. `{{passchangelog.md or HANDOFF.md}}` — most recent session state

Do not start writing code before completing steps 1–5.

---

## Project state

**Current phase:** {{Phase N — Name}}
**Active track:** {{Track A / B / C}}
**Current version:** {{vX.Y.Z}}
**Last session:** {{YYYY-MM-DD}} — {{one-line summary of what was done}}

---

## Finding your task

1. Open `DEV-PATH.md` and locate your task ID in the task registry
2. Check its status — confirm it is `planned` or `in_progress`, not `blocked` or `done`
3. Check its dependencies — confirm all predecessors are `done`
4. Open the task file and read the invariants and acceptance criteria before proceeding

If your task is blocked, read the blocker note and escalate if you cannot resolve it.

---

## Model routing

{{Copy a condensed version of your routing table here.}}

| Task type | Agent window | Model tier |
|-----------|-------------|-----------|
| Governance / audit | Window 1 | Premium |
| Code generation | Window 2 | Strong code |
| Batch / boilerplate | Window 3 | Budget |

---

## Invariants

These rules apply to every task in this repo. Do not violate them.

1. {{Global invariant}}
2. {{Global invariant}}
3. Do not modify canonical planning docs without AL:2 authority or higher.
4. Do not commit without a task ID in the commit message.
5. Write a handoff entry in `{{passchangelog.md}}` when you finish.

---

## Commit convention

```
type(scope): short description

Task: {{DOMAIN.NN}}
```

Valid types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`

---

## When you finish

Write a handoff entry — see `docs/agent-kit/HANDOFF-PROTOCOL.md`.
At minimum: what you did, what you verified, what's next.
```

---

## Notes on filling this in

- Keep the read order to 6 steps or fewer. More than that and agents skip steps.
- The invariants section is the most important part. If an agent violates an invariant, it will be caught in audit — but it costs a session to fix. Better to state them clearly upfront.
- Update "Last session" and "Current phase" at the start of every session. Stale onboarding docs are worse than no docs.
- The routing table in onboarding should be a condensed version only — the full table lives in `ROUTING-PATTERNS.md`.
