# Task Template

Copy this file for each governed task. Name it `TASK-ID.md` (e.g., `PROJ.01.md`).

Tasks live in a `tasks/` or `passes/` directory inside the project repo.

---

## Template

```markdown
# {{PROJ.NN}} — {{Task Name}}

[METADATA]
- Task ID:      {{PROJ.NN}}
- Name:         {{Task Name}}
- Domain:       {{domain.area.subarea}}
- Role:         {{cluster-header | implementation | audit | migration | hotfix}}
- Authority:    AL:{{1 | 2 | 3}}
- Predecessor:  {{PROJ.NN-1 or "none"}}
- Successor:    {{PROJ.NN+1 or "none"}}
- Agent:        {{agent name or window}}
- Model:        {{model name or tier}}
- Status:       {{planned | in_progress | blocked | done | deferred}}
- Date:         {{YYYY-MM-DD}}

---

## Context

{{Why this task exists. What problem it solves. What prior task it builds on.}}

---

## Invariants

These rules must not be violated by this task or any task that follows it:

1. {{Invariant — state as a constraint, not a goal}}
2. {{Invariant}}

If an invariant cannot be satisfied, escalate before proceeding.

---

## Scope

**In scope:**
- {{What this task does}}

**Out of scope:**
- {{What this task explicitly does not do}}

---

## Acceptance criteria

- [ ] {{Verifiable condition}}
- [ ] {{Verifiable condition}}
- [ ] All existing tests pass
- [ ] No new invariant violations introduced

---

## Implementation notes

{{Optional — constraints, gotchas, references, or known edge cases.}}

---

## Audit trail

| Date | Agent | Action | Notes |
|------|-------|--------|-------|
| {{YYYY-MM-DD}} | {{agent}} | started | — |
| {{YYYY-MM-DD}} | {{agent}} | completed | {{summary}} |
```

---

## Cluster header pattern

A cluster header (`Role: cluster-header`) defines the governance envelope for a group of tasks. Write one before starting a new work area.

```markdown
# {{PROJ.00}} — {{Work Area}} Cluster Header

[METADATA]
- Task ID:    {{PROJ.00}}
- Name:       {{Work Area}} Cluster Header
- Domain:     {{domain.area}}
- Role:       cluster-header
- Authority:  AL:{{1|2}}
- Successor:  {{PROJ.01}}
- Agent:      {{agent}}
- Date:       {{YYYY-MM-DD}}

---

## Purpose

{{What this cluster is for. What problem area it governs.}}

---

## Cluster invariants

These invariants apply to every task in this cluster:

1. {{Invariant}}

---

## Task sequence

| ID | Name | Role | Status |
|----|------|------|--------|
| {{PROJ.01}} | {{name}} | implementation | planned |
| {{PROJ.02}} | {{name}} | implementation | planned |
```

---

## Naming conventions

- `{{PROJ}}` — project or domain prefix, 2–6 uppercase letters. Examples: `ECO`, `AUTH`, `API`, `DCP`
- `.00` — always a cluster header
- `.NN` — sequential integers, never reused
- Append `-draft` suffix for speculative work not yet accepted: `PROJ.01-draft`

## Authority level guide

| Task type | Typical AL |
|-----------|-----------|
| New invariants, constitutional changes | AL:1 |
| New interfaces, schema changes, canonical doc rewrites | AL:2 |
| Standard implementation, tests, refactors | AL:3 |
| Hotfixes | AL:2 minimum — document override reason |
