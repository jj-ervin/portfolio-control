# Team Onboarding

Templates for orienting new team members (human or agent) to a DCP-governed portfolio, and for managing shift handoffs between team members.

---

## TEAM-AGENTS.md template

Place this in your DCP root (alongside `projects.yaml`) or in each project repo. It is read by agents before starting work and shared with new human team members during onboarding.

```markdown
# {{Portfolio or Project Name}} — Team Onboarding

Read this before starting any work in this portfolio.

---

## Team

| Name / Role | Domains owned | Contact / window |
|-------------|--------------|-----------------|
| {{name}} | {{repos or domains}} | {{Slack, email, or agent window}} |
| {{name}} | {{repos or domains}} | {{contact}} |

---

## Domain ownership

See `docs/team-kit/REVIEW-ROUTING.md` for the full ownership map and review requirements.

Short version:
- {{repo or area}} → {{owner}}
- {{repo or area}} → {{owner}}

When in doubt about who to route a review to, check REVIEW-ROUTING.md.

---

## Read order for new members

1. This file
2. `DEV-CONTROL-PLANE.md` — boundary doctrine
3. `projects.yaml` — portfolio registry (what repos exist and their status)
4. `docs/team-kit/REVIEW-ROUTING.md` — domain ownership and review requirements
5. `ONBOARDING.md` — tool setup (dashboard, validator, pre-commit hook)
6. The DEVPLAN.md for your assigned project

Do not start any work before completing steps 1–5.

---

## Active tracks

| Track | Lead | Status | Description |
|-------|------|--------|-------------|
| {{Track A}} | {{name}} | {{active / blocked / done}} | {{what it is}} |
| {{Track B}} | {{name}} | {{active}} | {{what it is}} |

---

## Current blockers

- {{blocker or "none"}}

---

## Invariants

Every team member (human or agent) must follow these rules:

1. No AL:1 or AL:2 changes without the required review (see REVIEW-ROUTING.md).
2. Every task needs a task ID. No untracked work.
3. Write a handoff entry when you finish a session — see the shift handoff section below.
4. Domain owners are the final authority on their domains. Escalate disagreements, don't route around.
5. {{Team-specific invariant}}

---

## Agent windows

{{Copy a condensed routing table or reference ROUTING-PATTERNS.md}}

---

## How to hand off

Write a shift handoff entry in `{{passchangelog.md or SHIFT-LOG.md}}` when you finish.
See the shift handoff template in `docs/team-kit/TEAM-ONBOARDING.md`.
```

---

## New member checklist

Run through this when a new team member (human or agent) joins.

```markdown
## New member onboarding — {{name}} — {{YYYY-MM-DD}}

### Setup
- [ ] Clone portfolio root and run `dcp-setup.ps1`
- [ ] Confirm `dev-status.ps1` shows all expected repos
- [ ] Confirm `validate-pointers.ps1` reports clean

### Read
- [ ] DEV-CONTROL-PLANE.md
- [ ] docs/team-kit/REVIEW-ROUTING.md — know your domain and review obligations
- [ ] DEVPLAN.md for assigned project
- [ ] DEVPATH.md for assigned project

### Access
- [ ] Added to repo access (GitHub team, etc.)
- [ ] Added to communication channel
- [ ] Domain ownership table updated in REVIEW-ROUTING.md

### First task
- [ ] Assigned a starter task (AL:3 preferred for first contribution)
- [ ] Task file read and understood
- [ ] First PR reviewed by domain owner

### Done
- [ ] New member confirmed comfortable with tooling and process
```

---

## Shift handoff template

A shift handoff is written when one team member hands off to another — end of day, end of sprint, or any time someone picks up work mid-stream. Keeps a shared `SHIFT-LOG.md` (or prepend to `passchangelog.md`) in each active project.

```markdown
## {{YYYY-MM-DD}} — {{from: name/role}} → {{to: name/role}}

### Completed this shift
- {{What was done — task IDs, file paths, brief description}}

### Verified
- {{What was tested or checked: test names, commands run, manual checks}}

### State left in
- {{What is committed / clean / pushed}}
- {{What is staged, in-progress, or needs follow-up}}

### Open items
- {{Anything that needs attention — not necessarily blockers}}

### Blockers
- {{Any blockers — or "none"}}

### Recommended first action for next shift
- {{Task ID and what to do — eliminate cold-start cost}}
```

**Rules:**
1. Write one at the end of every shift. A one-liner is better than nothing.
2. Prepend, never append — most recent shift is always at the top.
3. Include the next recommended action. This is the most valuable line.
4. If you are handing off to an agent, be more explicit — agents have no implicit context.

---

## Shift log structure

One `SHIFT-LOG.md` per active project. Structure:

```markdown
# {{Project}} — Shift Log

Newest entry first.

---

{{entries prepended here}}
```

Keep it in the project repo root alongside `passchangelog.md`, or merge them into one file — the key constraint is that the most recent entry is always first.
