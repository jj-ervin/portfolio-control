# DevX Control Plane — Consulting Pitch

## The problem

AI-assisted development is being adopted fast and governed slowly.

Most developers running AI agents today have no routing, no audit trail, no planning standards, and no visibility across their repos. They're using powerful tools in a chaotic way — and the gap between "prompting an LLM" and "running a governed multi-agent workflow" is where productivity and reliability are lost.

At the same time, multi-repo portfolios have no standard tooling. Developers manage project status, planning docs, and cross-repo dependencies ad-hoc in Notion, spreadsheets, or not at all.

---

## The solution

**DevX Control Plane (DCP)** is a registry-driven portfolio control plane with first-class support for AI agent workflows.

It gives solo developers and small teams the operational discipline of a platform engineering stack, without the enterprise overhead.

In a single setup session you get:

- **Live portfolio dashboard** — git status, project lifecycle, and planning health across every repo in one command
- **Typed registry** — `projects.yaml` as the single source of truth; every project indexed, every plan pointer verified
- **Boundary doctrine** — hard rules for what lives in governance, standards, execution, and runtime layers — so AI agents always know where to look and where to write
- **Integrity tooling** — pre-commit guards and pointer validators that catch drift before it becomes a problem
- **Planning templates** — consistent, agent-readable DEV-PLAN, DEV-PATH, and TRACKS docs across all projects
- **Agent routing layer** — model routing patterns and task-level governance so multi-agent workflows are reproducible, not accidental

---

## Who it's for

- **Solo developers** running 3+ repos with AI agents
- **Small teams** (2–8 people) adopting AI-augmented development
- **Studios and consultancies** building AI-assisted products who need governance without bureaucracy

---

## What you get

### DCP Core (open source)
Registry, dashboard, boundary doctrine, integrity tooling.
Self-service — clone, configure `projects.yaml`, run.

### DCP Governance Kit
Planning templates, normalization standard, validator.
For teams who need consistent planning across repos.

### DCP Agent Kit
Task governance templates, model routing patterns, agent onboarding templates, multi-agent handoff protocol.
The layer that makes AI workflows reproducible and auditable.

### DCP Consulting Engagement
A structured setup engagement delivered in 1–3 sessions:

**Session 1 — Portfolio audit and registry setup**
Map your repos, configure `projects.yaml`, establish boundary doctrine, wire integrity tooling.

**Session 2 — Planning normalization**
Audit existing plan docs, establish canonical plan pairs per project, apply templates, validate all pointers.

**Session 3 — Agent Kit setup** *(optional)*
Configure model routing for your agent workflow, write task templates for your key task types, establish handoff protocol.

**Deliverables:** Working DCP instance, configured registry, clean planning baseline, agent routing table, team walkthrough.

---

## Why now

The window to establish governance *before* AI agent workflows become entrenched is closing. Teams that establish routing, audit trails, and planning standards now will iterate faster and debug less than those who retrofit governance later.

DCP is a proven pattern — built in production on a real multi-repo AI-assisted portfolio, reviewed and validated against enterprise service catalog standards (Backstage), and designed to be adopted in a day, not a quarter.

---

## Next step

Clone the repo and run `.\dev-status.ps1` on your portfolio.
If you want a setup engagement, reach out directly.
