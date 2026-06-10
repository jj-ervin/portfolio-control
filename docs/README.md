# docs/

Portfolio-level documentation for `c:/dev`.

## Structure

```
docs/
  agent-kit/     Agent handoff, routing, and onboarding patterns
  team-kit/      Team review, routing, and onboarding patterns
  sessions/      Captured synthesis sessions and reusable analysis outputs
  sources/       Research articles — industry standards, AI governance, platform direction
  templates/     Reusable planning and status templates
  gap-analysis-framework.md
  README.md      This file
```

## Key docs

- [`gap-analysis-framework.md`](gap-analysis-framework.md) — portable 12-question gap-analysis framework for eco, governance-commons, DCP, and comparable AI governance platforms.
- [`sessions/2026-06-09-research-synthesis.md`](sessions/2026-06-09-research-synthesis.md) — synthesis across 102 sources that produced the current gap inventory.

## sources/

Research articles fed into Claude and other agents to guide eco ecosystem development
toward industry standards and emerging practice. Articles are numbered sequentially
(`source_01.md` → `source_N.md`) with a master index in `INDEX.md`.

### Adding a new source

1. Copy the next available `source_N.md` placeholder
2. Fill in the frontmatter (title, publication, date, topics, relevance)
3. Add a summary, key points, and any relevant quotes
4. Add a row to `INDEX.md`
5. Commit both files together

### Topic tags

Use consistent tags across sources so the index stays filterable:

| Tag | Covers |
|---|---|
| `ai-governance` | AI policy, trust frameworks, safety standards |
| `agent-runtime` | Agent orchestration, multi-agent systems, LLM ops |
| `platform-architecture` | Developer platforms, modular systems, API design |
| `observability` | Telemetry, tracing, monitoring, audit |
| `identity-trust` | Auth, zero-trust, credential management |
| `ux-design` | UI/UX patterns, design systems, cockpit/shell design |
| `data-contracts` | Schema standards, validation, data governance |
| `devex` | Developer experience, tooling, CLI design |
| `llm-infra` | Model serving, inference, fine-tuning, embeddings |
| `open-source` | OSS strategy, licensing, community governance |

Add new tags as needed — keep them lowercase, hyphenated.

### Relevance tags

Reference which eco repos a source directly informs:

`eco` · `.eco` · `eos` · `cockpit` · `governance-commons` · `agent-dossier` ·
`agent-matrix` · `ons` · `niji` · `devxtoolkit-v1-x` · `devxtoolkit-v2-x`
