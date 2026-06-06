# Handoff Protocol

A session handoff is written at the end of every agent session. It is the audit trail entry for that session and the onboarding context for the next.

Keep a `passchangelog.md` (or `HANDOFF.md`) in each active project repo. Prepend new entries at the top so the most recent session is always first.

---

## Handoff entry template

```markdown
## {{YYYY-MM-DD}} — {{Agent / Window}} — {{Task ID}}

### Completed
- {{What was done — be specific, reference task IDs and file paths}}

### Verified
- {{What was tested or checked — specific commands, test names, or manual checks}}

### State left in
- {{What is committed / clean / pushed}}
- {{What is staged or uncommitted, if anything}}

### Blockers
- {{Any blockers encountered — or "none"}}

### Next recommended step
- {{Task ID and description of what should happen next}}
- {{Any context the next agent needs that isn't obvious from the code}}
```

---

## Minimal handoff (short sessions)

For quick sessions with a single clear outcome:

```markdown
## {{YYYY-MM-DD}} — {{Task ID}} — done

{{One sentence: what changed.}}
Next: {{Task ID}} — {{what it is}}.
```

---

## Rules

1. **Always write one.** Even a one-line handoff is better than no handoff. The next agent — or you returning after a break — will thank you.
2. **Prepend, never append.** Most recent entry at top. The reader should not scroll to find current state.
3. **Reference task IDs.** Every completed task should have a task ID. If work was done without a task file, note that as a gap.
4. **State what was verified, not just what was done.** "Wrote tests" is less useful than "ran pytest -q — 12 passed, 0 failed."
5. **Include the next step.** The most valuable line in a handoff is the next recommended action. It eliminates the cold-start cost for the next session.

---

## Passchangelog structure

A `passchangelog.md` is the running session log for a project. Structure:

```markdown
# {{Project}} — Session Log

Newest entry first.

---

{{entries prepended here}}
```

One file per project. Not one file per session.

---

## When to escalate in the handoff

If a session ended in a blocked state, the handoff must include:

- What the blocker is
- What was tried
- What information or decision is needed to unblock
- The escalation level reached (see `ROUTING-PATTERNS.md`)

A handoff that says "blocked — not sure why" is not a handoff. Diagnose before you stop.

---

## Relationship to task files

The task file (`TASK-TEMPLATE.md`) has an audit trail section. The handoff goes there too — or links to the passchangelog entry. Both places should be updated when a task completes.
