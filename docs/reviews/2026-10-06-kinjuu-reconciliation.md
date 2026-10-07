# Kinjuu reconciliation — 2026-10-06

Kinjuu is the canonical private source for an implemented manual-entry obligation tracker. It is substantially beyond its original scaffold: accounts, cards and obligations have UI and local persistence; status changes generate payment/audit history; calendar and reminder settings exist; and reminder scheduling code is wired. Exact-head proof passes 14 tests, analysis and a web compile.

It is not release-complete. The only checked-in platform surfaces are Windows and web, and the notification service deliberately schedules on neither. There is no hosted CI, tag, release, install artifact or ordinary-user proof. The README's feature-complete, platform and disabled-widget-test claims are stale.

## Provenance and boundaries

This review continues the 74-row inventory saved under `C:\Users\Jess\Documents\Codex\2026-10-05\referenced-chatgpt-conversation-this-is-an\outputs`. The CXP report named Kinjuu as next. Completed project reports were not repeated.

The governing product contract is `docs/architecture/Kinjuu_Core_v0.1_Product_Spec.md`: Kinjuu Core v0.1 is a local, manual-entry obligation/reminder tracker, not bank connectivity, payment initiation, credential storage, a budgeting engine or accounting software. Future Kinjuu Connect ideas remain future scope. No old brainstorm was promoted into the build contract.

The recent ChatGPT listing exposed no earlier Kinjuu product conversation. The only Kinjuu-titled Classic chat was the new access/handoff discussion and added no product requirements; archived ChatGPT results were empty. Recoverable intent therefore comes from the committed product/technical specs, PASS history, code and Git history. This is not claimed as complete historical chat coverage.

## Local and GitHub state

`C:\dev\kinjuu` is an independent Git root. Local `main`, `origin/main` and live private GitHub `main` match at `e6167955068a200cdf4737a0595275718dd5cf61`. GitHub reports one branch, no tags/releases, no Actions runs, no PRs and no issues. The repository is private and unarchived.

The checkout has one tracked change: the previously authorized first-line correction in tracked `dev-path.md`, from `# kinjuu — DevPath` to `# DEV-PATH — kinjuu`. The rest of the file is byte-for-byte unchanged. This audit preserved it and made no Kinjuu source or planning edits. There are no stashes. Existing ignored Flutter/Dart build state, test databases, IDE files and logs were not cleaned or opened as user data.

There is no second Kinjuu app checkout or GitHub repository in the inspected account/organizations. `C:\dev\dev-docs\kinjuu` is a historical planning backup inside the separate `jj-ervin/dev-docs` repository, not an app duplicate. Its `DEV-PATH.md` differs only by retaining the old first line. The dev-docs repository's unrelated unpublished commit remains preserved.

## Implemented behavior

- Seven routes expose dashboard, obligations, obligation editing, accounts/cards, calendar, history and settings.
- Default controllers use SQLite-backed repositories for accounts, cards, obligations, payment events, notification rules and audit entries. Tests also have an isolated in-memory factory.
- Accounts/cards/obligations support create/update/archive. Obligations support paid/pending transitions, derived due status, payment events and audit entries.
- Calendar/upcoming, history and configurable global reminder defaults are implemented.
- Reminder synchronization runs on load and obligation mutations. The service uses timezone-aware local notifications on Android, iOS, macOS and Linux, while web and Windows return the unsupported/no-op path.
- Subscription schema/entity/repository types exist, but subscriptions are not in the active controller or UI. App lock/biometric access, export/delete, privacy copy and encrypted/secure settings are not implemented.

The data model enforces manual sources for obligations/subscriptions and stores masked account/card references. That supports the low-risk boundary, but code inspection and tests are not a privacy/security certification.

## Fresh proof

An exact-HEAD archive was tested outside `C:\dev` with Flutter 3.41.6 and Dart 3.11.4. Dependency resolution with the committed lock succeeded; the proof copy changed only lockfile line endings from LF to CRLF, not logical dependency content. Thirty-three newer incompatible package versions were reported but no upgrade was attempted.

- 14 Flutter tests pass, including controller persistence/reminder cases and widget tests.
- `flutter analyze` reports no issues.
- `flutter build web` succeeds. Its WASM dry run reports a `flutter_timezone` JS-interop incompatibility, so this proves the normal web compile, not WASM readiness.
- A Windows build stops at Flutter's plugin symlink requirement. Developer Mode and system settings were not changed.
- The repo's own governance validator exits successfully only in declared stub mode and reports ten rules still declared/unimplemented.

The web build is compile evidence only. The default web database path selects `sqflite` without a committed web backend or a web persistence test, and reminders are disabled on web. No browser workflow was claimed.

## Classification

| Class | Evidence |
| --- | --- |
| CANONICAL | `jj-ervin/kinjuu` and `C:\dev\kinjuu` are the sole mapped app identity; committed product spec defines the manual-entry boundary. |
| IMPLEMENTED | Accounts/cards/obligations CRUD, SQLite persistence, paid/pending history, audit data, calendar, settings and reminder scheduling code; 14 tests. |
| PARTIAL | Subscriptions; supported-platform delivery; web persistence; app lock; export/delete; privacy copy; CI; packaging; release/adoption proof. |
| STALE | README feature-complete wording, disabled-widget-test note, Android/iOS/build/docs paths, unresolved license; pubspec still calls the app a scaffold; DEV-PATH records only the initial stub. |
| SUPERSEDED | The empty-scaffold phase as a description of current application code; retained as history. |
| CHAT-ONLY | No additional Kinjuu product requirement was recovered from the accessible Classic chat window. Future connected-finance ideas remain unimplemented spec scope. |

## Recovery order

1. Choose one real supported target for v0.1 notification delivery, or explicitly re-scope the product away from reminders on Windows/web.
2. Prove a complete installed user path on that target: create data, restart/reload, receive/tap/cancel reminders, inspect history and verify destructive confirmations.
3. Resolve the v0.1 contract gaps: subscriptions, app lock/biometric target, export/delete, privacy copy and storage/security posture, or narrow the spec and README honestly.
4. Add CI for locked dependency resolution, tests, analysis and the chosen target; then create explicit release gates, packaging and adoption proof.
5. Resolve licensing before distribution. Align README/pubspec/planning through scoped edits while preserving DEV-PATH history and the existing header correction.

No commit, push, release, deployment, merge, branch, deletion, system-setting change or live-service exercise occurred.

## Remaining portfolio queue

Before this review, exactly 20 inventory rows still carried either `UNCLASSIFIED` or the generic `release status separately verified or pending` label. Kinjuu is now evidence-backed, leaving 19 such rows. The next efficient reconciliation is the Claude Budget Bar source/public-release pair; the full queue and per-row action are in `remaining-review-queue.md`.
