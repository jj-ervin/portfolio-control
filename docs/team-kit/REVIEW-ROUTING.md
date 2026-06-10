# Review Routing

Domain ownership and PR governance for teams using DCP. Copy this into your DCP root and fill in the tables.

---

## Domain ownership map

Each domain has one owner and zero or more reviewers. The owner is the final authority on changes to that domain. Reviewers must be consulted but cannot block alone.

Copy and fill in:

```markdown
## Domain ownership

| Domain | Owner | Reviewers | Notes |
|--------|-------|-----------|-------|
| {{repo or area}} | {{name}} | {{name, name}} | {{any notes}} |
| {{repo or area}} | {{name}} | {{name}} | — |
```

**Rules:**
- Every active repo must have exactly one owner.
- Ownership transfers are AL:2 changes — they require a planning doc update, not just a verbal agreement.
- An owner may be a person or a named agent role (e.g., "Window 1 — governance agent"). Be explicit.

---

## Authority level review requirements

Changes are classified by authority level. The review requirement scales with the authority level of what is being changed, not the size of the diff.

| Authority level | What it covers | Review requirement |
|----------------|---------------|-------------------|
| AL:1 | Constitutional — new invariants, boundary doctrine changes, canonical doc rewrites that set permanent rules | Owner + at least one other team member. Both must explicitly approve. |
| AL:2 | Architectural — new interfaces, schema changes, planning doc updates, ownership transfers | Domain owner must approve. One reviewer minimum. |
| AL:3 | Operational — standard implementation, tests, refactors, planning notes | Domain owner approval OR designated reviewer approval. |
| Hotfix | Any level — emergency fix bypassing normal flow | AL:2 minimum review after the fact. Document override reason in PR. |

**Never merge an AL:1 change without two explicit approvals.** Size is irrelevant — a one-line invariant change is AL:1.

---

## Change type routing table

What changes route to which reviewer:

| Change type | Routes to | Notes |
|-------------|-----------|-------|
| New invariant in any planning doc | Domain owner + second team member | AL:1 — two approvals required |
| Boundary doctrine change (DEV-CONTROL-PLANE.md) | All active team members | AL:1 — affects everyone |
| New interface or schema | Domain owner | AL:2 |
| DEV-PLAN.md / DEV-PATH.md update | Project owner | AL:2 |
| projects.yaml ownership or path change | Portfolio owner | AL:2 |
| Standard implementation PR | Domain owner or designated reviewer | AL:3 |
| Test-only PR | Any reviewer | AL:3 — lowest risk |
| Dependency upgrade | Domain owner | Check for AL:2 surface area (schema, interface changes) |
| Planning template change | Template owner | AL:2 — affects all future projects |

---

## Planning doc change policy

Planning docs have authority levels. Changes to them must be handled accordingly.

| Doc | Authority level | Who can approve changes |
|-----|----------------|------------------------|
| `DEV-CONTROL-PLANE.md` | AL:1 | All team members |
| `DEV-PLAN.md` (any project) | AL:1 for invariants; AL:2 for milestones | Project owner |
| `DEV-PATH.md` (any project) | AL:2 | Project owner |
| `projects.yaml` | AL:2 for ownership fields; AL:3 for status/description | Portfolio owner |
| `docs/templates/` | AL:2 | Template owner |
| `TRACKS.md` | AL:2 | Project owner |

**Agents operating on planning docs** must have their authority level explicitly set in the task file. An agent with AL:3 authority cannot modify a DEV-PLAN.md invariants section without escalating to AL:2.

---

## PR conventions

```
type(scope): short description

Task: {{DOMAIN.NN}}
AL: {{1 | 2 | 3}}
Reviewers: {{name or role}}
```

The `AL:` line is required on any PR touching planning docs. It tells reviewers what review level applies before they open the diff.

---

## Transferring ownership

Ownership transfers must be:
1. Proposed in a PR that updates this file's domain ownership table
2. Approved by the outgoing owner (or a senior team member if the owner is unavailable)
3. Reflected in `projects.yaml` if the repo entry has an `owner:` field
4. Announced in the team's primary communication channel

Unilateral ownership changes are not valid regardless of merge authority.
