# Team Kit

The DCP Team Kit extends the control plane for multi-person teams. It adds three things the solo Agent Kit does not cover: shared registry ownership, role-based review routing, and team-level onboarding and handoff.

---

## Who this is for

Teams of 2–8 people running AI-augmented multi-repo development. Specifically:
- A team sharing a single DCP portfolio registry
- Multiple people (or agents operating on behalf of people) making changes to planning docs, routing tables, and canonical specs
- Teams doing shift work, async handoffs, or parallel tracks across different time zones or windows

If you are a solo developer, the Agent Kit (`docs/agent-kit/`) is sufficient. Team Kit adds the coordination layer on top.

---

## What it adds

| Module | File | Governs |
|--------|------|---------|
| Domain ownership | `REVIEW-ROUTING.md` | Who owns what; who must review which changes |
| PR governance | `REVIEW-ROUTING.md` | Review requirements by authority level and change type |
| Team onboarding | `TEAM-ONBOARDING.md` | TEAM-AGENTS.md template; new member checklist |
| Shift handoff | `TEAM-ONBOARDING.md` | Session handoff between team members (not just agents) |

---

## Relationship to Agent Kit

Agent Kit governs a single agent's task lifecycle — how it receives work, routes decisions, and hands off to the next session.

Team Kit governs the boundary between people and agents — who owns a domain, who can approve a change, how a new team member (human or agent) gets oriented.

They compose: an agent onboards via `AGENTS.md` (Agent Kit), operates within domain boundaries set by `TEAM-AGENTS.md` (Team Kit), and hands off via the handoff protocol (Agent Kit). Neither replaces the other.

---

## Relationship to agent-team-protocol

`agent-team-protocol` (governance-commons) is the machine-side counterpart to Team Kit. It governs how agents delegate to each other at execution time — trust topology, shared audit trail, fleet escalation.

Team Kit is the human-governance layer: process patterns, templates, and conventions for teams running agent fleets. `agent-team-protocol` is the runtime spec those fleets operate under.

---

## Adoption guide

**Minimal (start here):**
1. Copy `REVIEW-ROUTING.md` into your DCP root. Fill in the domain ownership table.
2. Share it with the team. Every member should know who owns what.
3. Apply the authority level review requirements to your PR process.

**Full:**
1. Domain ownership map (REVIEW-ROUTING.md)
2. TEAM-AGENTS.md in each active project repo (TEAM-ONBOARDING.md template)
3. Shift handoff log per project (TEAM-ONBOARDING.md shift handoff section)
4. New member onboarding checklist (TEAM-ONBOARDING.md)

---

## File map

```
docs/team-kit/
  TEAM-KIT.md              — this file
  REVIEW-ROUTING.md        — domain ownership, PR governance, review routing
  TEAM-ONBOARDING.md       — TEAM-AGENTS.md template, new member checklist, shift handoff
```
