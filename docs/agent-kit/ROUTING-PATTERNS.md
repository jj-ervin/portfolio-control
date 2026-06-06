# Routing Patterns

A model routing reference for multi-agent workflows. Adapt the specific models to your toolset — the patterns and principles are portable.

---

## The routing principle

**Route by task type, not by agent availability.**

Every task has a type. Every type has a trust and capability profile. Match the task to the agent and model tier that fits that profile — don't just send everything to the most powerful model.

The two axes are:
- **Trust** — how much can go wrong if the agent makes a bad decision?
- **Capability** — what level of reasoning or code generation does the task need?

High trust × high capability → senior agent, premium model
Low trust × low capability → any agent, budget model

---

## Agent window pattern

A common setup for solo AI-augmented development is three concurrent agent windows, each with a clear role:

| Window | Role | Agent type | Model tier |
|--------|------|-----------|-----------|
| Window 1 | Governance, architecture, audit, prompt generation | Claude Code (or equivalent) | Premium reasoning model |
| Window 2 | Structured code generation, multi-file scaffolding | Codex / agentic IDE | Strong code model |
| Window 3 | Batch structural work, boilerplate, stubs | Copilot Chat / inline | Budget or free tier |

Each task routes to exactly one window. Never split a task across windows mid-execution.

---

## Task type routing table

| Task type | Window | Model tier | Notes |
|-----------|--------|-----------|-------|
| Governance doc (cluster header, invariants) | 1 | Premium | Always high-trust agent. Never budget. |
| Architecture decision | 1 | Premium | — |
| Audit / drift check / adversarial review | 1 | Premium | — |
| Prompt generation for other agents | 1 | Premium | Senior agent writes the prompt; other agent executes |
| Simple governance draft (no new invariants) | 1 | Mid-tier | Only when premium is overkill |
| Constitutional change (new core invariants) | 1 | Top-tier | Escalation only — highest available model |
| Multi-file code scaffolding | 2 | Strong code | — |
| Interface or schema implementation | 2 | Strong code | — |
| Test writing | 2 | Strong code | Budget models cannot reliably write tests |
| Large extraction or decomposition (>500 lines) | 2 | Specialised code | Use a code-tuned model for large structured output |
| Batch file moves, import reconciliation | 3 | Budget / free | No reasoning required — mechanical work |
| Single-file boilerplate or stubs | 3 | Budget | — |
| Simple in-editor edits | 3 | Free tier | Lowest stakes work |

---

## Cost discipline rules

1. **Default to mid-tier.** Premium models are for governance and architecture. Don't use them for implementation unless the task has AL:1 or AL:2 authority.
2. **Tests always need a capable model.** Budget models produce syntactically correct but semantically wrong tests. Use at least a strong code model.
3. **Batch mechanical work costs nothing.** File moves, import reconciliation, namespace refactors — use the cheapest capable model.
4. **Escalate explicitly.** If a task needs a higher tier than initially routed, note it in the task file. Don't silently upgrade.

---

## Escalation levels

When a task fails or is blocked, escalate through these levels before giving up:

| Level | Name | Trigger | Action |
|-------|------|---------|--------|
| 0 | Self-recovery | First failure | Retry with same agent, fix the issue |
| 1 | Peer handoff | Retry limit reached | Hand off to the other capable window |
| 2 | Operator clarification | Peer handoff exhausted | Pause and ask the human |
| 3 | Compliance stop | Safety or integrity risk | Halt, preserve audit trail, report |

Never skip levels. A compliance stop that could have been resolved at level 2 is a governance failure.

---

## Building your own routing table

Replace the model names with your actual tools. The structure is what matters.

```markdown
## My routing table

| Task type | Agent | Model | Notes |
|-----------|-------|-------|-------|
| Governance / audit | {{Window 1}} | {{Your premium model}} | — |
| Code generation | {{Window 2}} | {{Your code model}} | — |
| Batch / boilerplate | {{Window 3}} | {{Your budget model}} | — |
```

Add rows for task types specific to your domain. The goal is that any task can be looked up and routed without judgment calls.

---

## Routing anti-patterns

- **Everything to the best model** — wastes money, builds no routing discipline
- **Routing by who's free** — produces inconsistent quality and trust violations
- **Governance tasks to code agents** — architecture decisions made by a code-focused model without governance context
- **Tests to budget models** — produces tests that pass by coincidence, not by correctness
- **No escalation path** — blocked tasks stay blocked indefinitely
