# DCP Agent Kit

**Module:** DCP Agent Kit (v0.4.0 target)
**Layer:** AI-agent governance — sits above Core and Governance Kit

---

## What this is

The Agent Kit is the layer of DCP that makes multi-agent workflows reproducible, auditable, and governable. It is the primary differentiator between DCP and generic service catalog or project management tools.

Most tools solve the portfolio visibility problem. The Agent Kit solves the **agent coordination problem**:

- How do you decide which agent or model handles which task?
- How does an agent know what state the project is in before it starts?
- How do you hand off work between sessions without losing context?
- How do you audit what an agent did and why?

---

## Contents

| File | Purpose |
|------|---------|
| `TASK-TEMPLATE.md` | Generalised task governance template — typed header, execution contract, audit trail |
| `ROUTING-PATTERNS.md` | Model routing reference — task type → agent type → model tier |
| `AGENT-ONBOARDING.md` | Agent session onboarding template — what an agent reads before starting work |
| `HANDOFF-PROTOCOL.md` | Session handoff template — what an agent writes when it finishes |

---

## Core concepts

### Authority Levels

Every task carries an authority level that signals its governance weight:

| Level | Meaning | Who decides |
|-------|---------|-------------|
| AL:1 | Constitutive — changes invariants or core contracts | Senior agent or human only |
| AL:2 | Architectural — changes structure, interfaces, or canonical docs | Senior agent |
| AL:3 | Operational — standard implementation work | Any capable agent |

Authority levels prevent low-trust agents from making high-impact decisions silently.

### Task IDs

Tasks use a typed ID format: `PROJECT.NN` or `DOMAIN.NN`

- `PROJ.00` — cluster header (defines scope and invariants for a work area)
- `PROJ.01` — first implementation task in that cluster
- Sequential, never reused, never reassigned

IDs create a permanent audit trail. A task ID in a commit message, comment, or changelog entry is always traceable back to its governance document.

### Task roles

| Role | Meaning |
|------|---------|
| `cluster-header` | Defines scope, invariants, and acceptance criteria for a work area |
| `implementation` | Executes work within a cluster's contract |
| `audit` | Reviews output against invariants — no new code |
| `migration` | Moves or restructures existing work |
| `hotfix` | Breaks normal sequencing — must document why |

### Routing

Tasks route to agents based on task type, not agent availability. See `ROUTING-PATTERNS.md`.

The key rule: **governance and audit tasks always route to the highest-trust agent.** Implementation tasks route to the most cost-efficient capable agent.

---

## How to adopt

**Minimal adoption (just task templates):**
Copy `TASK-TEMPLATE.md` into your project. Write a task file for each work item. Reference the task ID in commits.

**Full adoption:**
1. Define your agent windows and model assignments in a local routing table (use `ROUTING-PATTERNS.md` as a starter)
2. Write a project-specific onboarding doc from `AGENT-ONBOARDING.md`
3. Use `HANDOFF-PROTOCOL.md` at the end of every session
4. Keep a `passchangelog.md` per project as a session audit log

---

## Relationship to Governance Kit

The Governance Kit (DEV-PLAN, DEV-PATH, TRACKS) gives projects structured direction docs.
The Agent Kit gives agents structured task governance.

They are complementary: the Governance Kit tells agents *where the project is going*, the Agent Kit tells agents *how to do individual tasks*.
