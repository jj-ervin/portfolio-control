# Cockpit reconciliation â€” 2026-10-06

Cockpit is the universal UI host and reusable application shell. Marlin, eco and other providers retain domain/execution authority. Current code plus `docs/architecture/cockpit-current-state.md` supersede early eco-only framing and recovered helper-extraction queues.

## Local, remote and Classic evidence

The local checkout started clean on main fb71dae202b28f48db91759e56be2b5397d68a2d, matching GitHub. No local-only Cockpit work was missing from that main snapshot. Two retrieved Classic discussions are saved alongside this report; they are historical intent, not instructions to resume every old idea.

The previously unresolved renderList fix is verified: [Run #74](https://github.com/jj-ervin/cockpit/actions/runs/35951757724) succeeded at 1df6ba77eebe18c2fc38ac63a87ca309d0f20d4b. [Current-main Run #147](https://github.com/jj-ervin/cockpit/actions/runs/36269624113) succeeded at fb71dae. Its JavaScript job selected only three test files, so green hosted CI did not establish the health of all browser-side tests.

[PR #27](https://github.com/jj-ervin/cockpit/pull/27), palette-e2e-hardening, is open and six commits ahead of main. Its latest [Run #151](https://github.com/jj-ervin/cockpit/actions/runs/36393348448) failed on missing parameter-schema propagation. It also broadens JavaScript coverage. It was not merged or changed during this work; overlapping local corrections mean it should be rebased and checked before adoption.

There are 27 remote branches including main. Of the 26 others, 23 are ancestors with zero commits ahead. The command-interface-proof branch is three ahead/fourteen behind, but all three differing-history files match main byte-for-byte after normal line-ending conversion. This is duplicate content with divergent history, not missing implementation. The Reddit publishing branch is fourteen ahead/210 behind and contains distinct dormant publishing/scheduler work. Preserve it pending an explicit product decision; no posting or scheduling was performed. Branches were not deleted.

## Classification

| Work | Status | Meaning/action |
| --- | --- | --- |
| Universal shell/provider authority boundary | CANONICAL | Current-state authority, not old eco-only lead paragraph. |
| Independent derived AppShell consumer | IMPLEMENTED | Minimum reusable-shell proof; PR #19 merged September 26. |
| Further helper-by-helper extraction | SUPERSEDED | Requires a concrete consumer, contract gap or duplication before resuming. |
| Catalog v1.1 and CockpitState | IMPLEMENTED | Metadata/state boundaries exist; baseline command review exposed a wiring regression repaired here. |
| CKP.19.00 | CANONICAL / CLOSED | No queued authoritative CKP.20 implementation PASS; do not invent one. |
| Second-provider proof | IMPLEMENTED | Niji and Sealdex proofs satisfy the old entry condition; not public adoption proof. |
| Old Run #74 uncertainty | STALE / RESOLVED | Exact historical run verified successful. |
| PR #27 palette hardening | PARTIAL | Open branch and failed broader CI; needs rebase/recheck after scoped fixes. |
| Reddit publishing feature | PARTIAL / DORMANT | Distinct remote branch work; no current adoption authorization. |
| Marlin update/remove mutation UI | PARTIAL / PROVIDER-OWNED | Marlin INIT.19.06 scope, not an automatic Cockpit task. |
| Public installer/publication | UNESTABLISHED | GitHub release and tag lists were empty at inspection. Source/provider tests do not prove human install readiness. |

## Bounded repairs

The baseline full JavaScript selection had 36 passing and three failed test entries (including a syntactically invalid placeholder). Host-web had 62 passing and two failed integration checks. The runtime omitted resolver parameterSchema, and three empty-workspace views still called a removed emptyDiv helper. Corrections preserve optional schema metadata and use the existing AppShell helper; no extra extraction or authority is introduced.

Tests retain the real command-review path, remove an invalid empty placeholder, reconcile static-preview expectations, and correct host fixtures to use boolean confirmation / expect rejection of string confirmation. A new headless regression exercises absent/empty workspace trees and empty repository lists without browser errors. CI now selects every web test file rather than only three. Confirmation validation remains intact.

The Python package version is 0.1.0, desktop/package metadata 1.0.0, and README build examples mention 1.1.0. These are different version surfaces; no automatic version bump or release inference was made. Cloud-host source tests are separate from deployment/tenant/security readiness. Dependencies and browser tests run in an isolated HEAD export with its own Cockpit virtual environment, not another project's environment.

## Recommended order

1. Review the scoped Cockpit working-tree corrections and test evidence; publish only after explicit push approval.
2. Rebase/recheck PR #27 against the corrected main and retain only remaining useful coverage.
3. Reconcile LASSO next, then remaining active repositories from the portfolio inventory.
4. Choose any new Cockpit feature from an actual product need. Keep Marlin mutation work in Marlin and dormant Reddit publishing separate.
5. Before a public Windows release, separately prove package integrity and the ordinary-user path: one obvious installer, cold/warm/repair behavior, and a runnable intended app. This reconciliation performs source validation, not that release exercise.

No commits, pushes, merges, new branches, publication, messages or remote deletions were performed.

## Verification results

| Check | Result |
| --- | --- |
| Python / real headless Chromium | 192 passed, four skipped |
| All web JavaScript tests | 41 passed |
| Web-host tests, including spawned Python/provider fixture | 64 passed, none skipped |
| Cloud-host tests | 65 passed, one platform-specific skip |
| Candidate bytes versus live edited files | Exact match for all seven source/test/CI changes |
| Planning history and backup | DEV-PATH/DEV-PLAN prefixes preserved; backup archive CRC valid |
| Git whitespace | Pass |

The four Python skips are opt-in real Marlin/Niji/Sealdex artifact gates and the real Marlin-installed provider smoke gate. They were not made green by fixtures. Historical provider proofs remain historical; this run does not refresh those artifact proofs. The Cloud-host skip is symlink containment: this Windows environment denied creation of the fixture symlink (EPERM). See the adjacent `*-tests*.txt` logs and scoped-checks.json.

All dependencies were installed only in the isolated proof tree. The live Cockpit checkout now contains eleven uncommitted edits. No unrelated local work existed in that checkout before this task, and no other project's source was edited.

## Governance closeout

All nine Level 1 validators passed. Full Level 4 remains failed on existing release gates: CXP four, canonical Governance Commons five, preserved duplicate Governance Commons ten. No Cockpit regression check failed after the corrections. Final PLAY validation accepts 22 records with zero errors/warnings. Source reconciliation is complete; portfolio release admission remains blocked. Timing is unmeasured (null timestamps and zero schema durations), not a measured zero-duration run. Next recommended project: LASSO.
