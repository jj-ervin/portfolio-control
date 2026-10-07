# Signal Radar reconciliation — 2026-10-06

Signal Radar has implemented Python foundations, fourteen passing existing tests and successful current-head hosted CI. It remains a partial evidence-first intelligence system. Its runtime evidence/export boundaries have reproduced gaps, and the commercial MOVE → EXPLAIN experiment has a locked plan but no established progress evidence in the inspected trackers or available historical references.

## Canonical identity and current work

Local `C:\dev\signal-radar` resolves to its own Git root and is linked to private `jj-ervin/signal-radar`. Local and remote main match at **5a62d6f54f472844ca97aba3247b8b82031a3208**. No synchronization or history replacement was needed. The preexisting local architecture edit was archived and preserved unchanged.

Remote `experiment/move-explain-day1` at `768d259baa1d2ffde93d0520dee9b44baafde51f` is two commits behind main and zero ahead. It is retained superseded ancestry, not hidden unmerged development. Inspected open issues, pull requests and releases are recorded in [remote evidence](remote-evidence.json).

The portfolio registry correctly points to **docs/experiment-plan.md**, not a nonexistent DEV-PLAN/DEV-PATH pair. The canonical current work is the **September 30–October 30, 2026 MOVE → EXPLAIN commercial experiment**, with October 7 payment-infrastructure deadline. The broad engineering roadmap remains queued under its explicit freeze. The experiment permits confirmed correctness fixes and manual research/evidence/tracking work; it freezes LLM, UI, Polymarket, storage, API and additional taxonomy work.

Signal Radar owns domain-independent evidence-first event intelligence, with prediction markets as its initial wedge. EdgeLab is downstream market-edge research and validation. Neither a Signal Card nor a commercial intelligence report establishes profitability or grants trading execution authority.

## Implementation classification

| Component / claim | Reconciled status |
| --- | --- |
| Observation, Evidence, Signal Python records and JSON schema files | IMPLEMENTED foundation; runtime/schema conformance incomplete |
| Generic ingestion, deterministic movement detection and SignalPipeline | IMPLEMENTED and fixture-tested |
| Kalshi public fetch and ingest_market normalization | IMPLEMENTED; mocked mapping test and scoped live fetch verified; direct pipeline composition incomplete |
| ResearchRequest/ResearchResult, known-ID basis checks, StaticResearchModel | IMPLEMENTED interface/stand-in; no real LLM provider; nested evidence isolation incomplete |
| Contextual evidence collection, historical replay/storage, cross-market intelligence | PLANNED/frozen; no production implementation established |
| Alert/dashboard/API delivery, real AI explanations, EdgeLab importer | PLANNED/frozen; no deployed product or integration established |
| MOVE → EXPLAIN experiment rules, template and CSV files | CANONICAL plan and IMPLEMENTED tracking scaffolds; execution/customer evidence unestablished |
| ChatGPT conceptual examples, missing TradeGPT comparison and broader automation suggestions | HISTORICAL/CHAT-ONLY where not represented by repository implementation |

The retrieved ChatGPT references are [Signal Radar Cleanup](chat-reference-0.json), [Continue Signal Radar Development](chat-reference-1.json) and [AI Income Workflow](chat-reference-2.json), alongside the prior trading-definition reference. Their returned pages expose no older cursor. They do not recover missing uploads or every earlier turn. Historical replies reference Fed repricing and a missing TradeGPT answer; those figures are not promoted into verified market observations or completed experiment reports.

## What was verified

The committed head was exported to an isolated workspace and tested without writing caches/build state into C:\dev. **14 tests pass**. Hosted [current-head Actions run](https://github.com/jj-ervin/signal-radar/actions/runs/36753288037) succeeds; job evidence covers Python 3.11, 3.12 and 3.13. The tests exercise fixtures, including the Kalshi mapping test; a test identifier containing “live” does not make it a network integration test.

Current official [Get Market documentation](https://docs.kalshi.com/api-reference/market/get-market) documents the endpoint and the two price fields used by the adapter. The [public market-data guide](https://docs.kalshi.com/getting_started/quick_start_market_data) describes unauthenticated data access. A separate read-only smoke check retrieved one market through the public endpoint and actual fetch_market method; both expected fields were present as strings. See [live fetch evidence](live-endpoint-smoke.json).

That check establishes fetch/field presence for one sampled market. It does not establish direct SignalPipeline composition, an experiment watchlist, preceding-24-hour movement timing, commercial report quality, redistribution rights or end-to-end provider integration. No authenticated account, order endpoint or funds operation was accessed.

## Reproduced correctness gaps

All reproductions use isolated fixture data and leave actual observations/source files unchanged. See [boundary proof](boundary-reproductions.json).

1. **Runtime/schema mismatch:** converting a normal generated Signal to JSON produces derived_metrics before/after properties prohibited by signal.schema.json. Adding validated research output also introduces an interpretation limitations property prohibited by that schema. There is no established supported serializer boundary that resolves these differences. Existing tests and CI do not test this conformance.
2. **Non-finite prices:** the numeric guard accepts NaN/infinity; the detector emits non-finite metrics. Strict JSON encoding rejects those records. This is a confirmed correctness gap, separate from deciding allowable ranges for generic versus probability data.
3. **Mutable evidence shared with research:** frozen dataclasses contain mutable nested values. ResearchRequest shares Observation payload references with Signal; mutating the request's fixture value changes the original observation from 0.68 to 0.99. The documented isolation promise is not mechanically enforced. No real LLM is currently integrated.
4. **Provider/pipeline seam:** KalshiMarketAdapter exposes ingest_market, while SignalPipeline expects ingest. The generic pipeline works, but direct provider composition remains planned.
5. **Timing and units:** a snapshot pair cannot establish when a move occurred. A fractional delta of 0.07 corresponds to seven percentage points; explicit conversion is necessary for the experiment's ranking/headlines. No existing UI/report renderer is demonstrated to make that conversion.

These are source-backed findings, not permission to broaden the frozen architecture. No runtime or schema change was made during reconciliation. The next proposed correctness task is **DRIVE** because it must explicitly reconcile exported contract behavior and evidence isolation, with negative regression coverage.

## Commercial experiment evidence

Jesse confirmed the evidence locations are ChatGPT, C:\dev or GitHub. The inspected repository shows:

- Thirty numbered prospect template rows, **zero named people or contact routes**, no dated exposure or payment fields populated.
- A move-selection file containing only its header; no recorded candidates, skips or report IDs.
- No fixed watchlist or completed, source-backed MOVE → EXPLAIN report found in the inspected files/retrieved references.
- No established Signal Radar payment mechanism or customer evidence. TBV's separate $9 checkout does not satisfy this product's experiment milestone.
- A source registry document listing required metadata but no completed Kalshi commercial-use/redistribution determination.

These are missing evidence, not a conclusion that zero customers exist or that the experiment has failed. The prospect defaults personal_relationship=no and price_quoted=25 are not verified facts about real people. The October 2 prospect/watchlist milestones are past their planned date; the October 7 payment deadline is still upcoming as of October 6. Neither deadline nor the October 30 decision rules was reset.

Source-use permission remains open. Public fetch access and a technical smoke check do not supply a commercial redistribution determination. An attempted direct data-terms page lookup was unavailable; no favorable legal conclusion was inferred or report sold.

## Applied reconciliation

Six scoped files were changed: README, roadmap, experiment-plan, source-pack, new experiment-status and new AGENTS bootstrap. They route future work to the actual canonical experiment, distinguish implemented foundations from automation proposals, record blank tracking evidence and preserve confirmed correctness findings. The bootstrap points to the existing portfolio onboarding protocol and local experiment freeze; it does not introduce a new authority document or planning type.

The original experiment dates, buyer groups, output cap, $25 price test, selection/timing rules, decision thresholds and engineering freeze remain unchanged. No prospect/payment/move data was fabricated. All runtime files, schemas, tracking files and preexisting architecture edits were preserved. See [before-edit archive](before-edits.zip), [exact diff](review.diff) and [file hashes](applied-edits.json).

## Work order

**Next portfolio task: RUN — Cockpit reconciliation.** Continue the agreed inventory recovery against its actual code, extraction/interface work, branches and CI. The trading conversation does not redefine the general Cockpit product.

**Next Signal Radar task: DRIVE — bounded correctness repair.** Reconcile the supported runtime/export schema, reject non-finite values and enforce research evidence isolation. Add tests that would fail on the reproduced cases; preserve observation/interpretation distinctions. Resolve provider composition only within an explicitly bounded seam, not by starting the frozen automation backlog.

**Commercial recovery: RUN — establish actual experiment evidence.** Recover or document the watchlist, named prospect list, independently timestamped qualifying report and source-use conclusion. Prepare a product-specific offer/payment setup for review before external action. No outreach, report publication, live checkout creation or sale was performed or authorized by this audit.

Governed portfolio release closure remains separate from completion of this inspection. Validation, preservation and the final PLAY summary are recorded below. No commit, push, branch split, release or trading action occurred.

## Final verification and PLAY closeout

All nine current Level 1 validators pass. Full Level 4 retains the real CXP/GC release blockers; source reconciliation completion is separate from release admission. The final playbook validator accepts all 21 records with zero errors/warnings. Runtime/schema/tests/tracker content matches committed HEAD modulo normal Git line endings; preexisting architecture edits are byte-preserved. Scoped links and whitespace checks pass. See [portfolio diagnostic](portfolio-validation.txt), [preservation/check results](scoped-checks.json) and [playbook result](final-playbook.json).

Latest PLAY: dcp-play-2026-10-06-signal-radar-reconciliation. Authorized inspection/docs complete; governed release status remains blocked on existing portfolio release gates.

| Read | Plan | Execute | Verify | Close |
| --- | --- | --- | --- | --- |
| Unmeasured | Unmeasured | Unmeasured | Unmeasured | Unmeasured |

Null timestamps/zero schema durations indicate unmeasured timing, not elapsed-time measurements. Next recommended step: RUN — Cockpit reconciliation.
