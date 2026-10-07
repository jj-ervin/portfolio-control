# Arche reconciliation — 2026-10-06

Arche is a declarative environment-semantics extraction scaffold. Its actual artifacts are one draft model, five examples and four candidate expected-outcome fixtures. It has no executable implementation, accepted machine schema, package/public API, release or verified consumer integration. Five documentation files now distinguish design from current evidence; no runtime, validator, schema, governed-source or release change was made.

## Local and remote

Initially clean local main matches private [jj-ervin/arche](https://github.com/jj-ervin/arche) main at `56225faa574ff61562e03a2675ce1d09ee3c4a6d`. GitHub has one branch, no tags/releases/open issues/open PRs and no Actions runs; tracked source has no application workflow or package manifest. Source folders contain placeholders and declarative fixtures, not executable code. Inventory test-path counts were metadata and must not be read as passing test counts.

## Authority and extraction

`C:/dev/eco/passes/arche/ARCHE.00.md` and `C:/dev/eco/arche/ARCHE.spec.md` remain the governing pass and source specification. Their design inputs exist and were read/hashed; all recorded authority-source hashes remain unchanged. The standalone draft explicitly defers to those sources. No acceptance or new authority was inferred from an assistant proposal, draft example or parsed YAML.

ARCHE defines environment identity, types, metadata, boundaries, invariants, transitions and capabilities. It does not execute, schedule, orchestrate, enforce policy, mutate state or grant permissions. Runtime/UI/tooling consumers remain responsible for their own interpretation and execution. The standalone repo is future extraction/package space, not a second independently accepted specification.

The old statement that eOS implements ARCHE at runtime is an architectural relationship, not current integration evidence. The reconciled thin eOS CLI does not load these definitions; the broader eco substrate remains separately stubbed. Read-only text searches of the inspected eOS, Cockpit, Marlin and editor source paths found no ARCHE/arche_environment implementation references. This bounded search is not proof that every possible consumer/source elsewhere has none. README now labels eOS interpretation as planned; governing eco documents were preserved.

## Actual declarative artifacts

One baseline environment-model draft describes type/version plus metadata id/name/description/tags/capabilities/invariants/transitions. Five examples cover workspace, project, cockpit, execution and operator. Pack, domain and kernel-bound are explicitly deferred. Seven further extraction documents are still missing by plan: types, metadata, boundaries, invariants, transitions, capabilities and consumer relationships.

Four authored fixtures cover allowed workspace-to-project and project-to-execution transitions, forbidden project-to-workspace, and a cockpit executable-capability conflict. They add a repo-local check block; they are not executable conformance tests or accepted schema artifacts.

All nine YAML files parse. Examples have the candidate model fields and nonoverlapping allowed/forbidden lists. All three external fixture references resolve to the intended example files; the fourth carries an inline candidate environment. These are syntax/shape/reference integrity checks only. No semantic evaluator was implemented and no authored expected outcome was converted into a passing conformance claim.

Outstanding modeling issues are visible rather than silently repaired: containment, parent-workspace and source-cockpit invariants are named without relational fields sufficient to verify them; the forbidden-transition fixture labels a parent-workspace invariant violation without separately demonstrating that condition. The source model uses a UUID identity placeholder while illustrative examples use named stable identifiers, and a source transition example uses execution_environment while the type vocabulary/example uses execution. A future accepted extraction contract must resolve identity and alias semantics before machine validation; this audit does not invent those decisions.

## Planning reconciliation

DEV-PATH's historical task registry still says planned for work later dated as completed. Historical ARCHE-P1-02 identifies fixture-format definition there, while DEV-PLAN uses it for the initial example set. Both scoped deliverables exist, but the same ID cannot safely drive future status automation. Appendices identify each by deliverable and retain the original labels/chronology. No past task was silently renumbered or deleted. ARCHE.2/.3/.4 remain partial rather than globally complete.

README corrects the runtime-consumer claim and documents actual artifacts/limits. DEV-PLAN, DEV-PATH, extraction inventory and fixture README receive dated evidence appendices. All four original append-only file contents remain exact byte prefixes, AGENTS is untouched and whitespace checks pass. No new feature roadmap was implemented merely because it was listed.

## Classification and recovery order

| Class | Evidence |
| --- | --- |
| CANONICAL | Governing eco pass/spec and standalone root planning; authority separation retained |
| IMPLEMENTED | Declarative draft model, five example documents, four candidate fixture records |
| PARTIAL | Extraction, accepted schema/API, relational invariant representation, task identity normalization, consumer proof |
| STALE | Literal current eOS-integration implication and historical task-status interpretation; clarified by dated evidence |
| SUPERSEDED | No accepted semantic definition was superseded; old scaffold milestones remain lineage |
| CHAT-ONLY | No extra Classic-only shipped capability established; consumer priorities remain design direction |

Next Arche work: define one bounded extraction scope through the appropriate accepted pass, settle identity/alias/relational fields and task identities, then prove one consumer. Do not automatically finish seven docs, three examples, a validator, runtime and package together. Consumer integration and application CI become meaningful after there is a concrete accepted contract.

The portfolio inventory remains74 entries. Next portfolio reconciliation: Elan, another distinct semantics/design repository; its active scope will be verified before changes.

## Governance closeout

Nine Level1 checks pass; existing Level4 CXP4/canonicalGC5/duplicateGC10 gates remain. PLAY accepts 33 records with zero errors/warnings. No release readiness is claimed.
