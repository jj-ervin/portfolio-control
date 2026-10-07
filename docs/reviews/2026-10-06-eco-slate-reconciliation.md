# eco-slate and website reconciliation — 2026-10-06

The repository pair has distinct roles: eco-slate holds draft governance/specification/registry guidance and an older OCRAFT prototype; eco-slate-www holds the actual Astro public preview. The old duplicate-CNAME diagnosis was incomplete. Live HTTP responses come from Netlify, while GitHub separately records eco-slate-www as a Pages owner. Seven initially scoped page/data/style files plus a shared sample footer were corrected locally; no live deployment occurred.

## Local, remote and branch evidence

Both initially clean local main branches match GitHub: eco-slate `146e94e6715a5f0651cbac9628d601c910eed2f5`; eco-slate-www `2566d52897e9b7a11638cd345b519033ae661130`. Both repos are public, with no releases/tags/open issues/open PRs in the inspected snapshot. Each has two remote branches. eco-slate's master is two commits behind main; the website's claude/repo-assessment-zcfJH branch is five commits behind main. Neither contains unique pending commits relative to main in the inspected local graph. No branch or history was changed.

The website has a distinct ignored nested `.eco` Git root, clean at `36d6429a`. Current jj-ervin/.eco main is `de1140c4`, four commits ahead with no nested-only commits. The checkout was preserved without fetching/updating its branch. The `.eco` directory in eco-slate resolves to the parent eco-slate Git root; it is not another independent clone.

## Hosting: what is established

Read-only HTTP probes reached Home, Dashboard, Oil, Docs and the Oil script on [eco-slate.org](https://eco-slate.org/). Response headers identify Netlify (Server and Cache-Status). Home, Docs and Oil HTML hashes exactly match the unmodified main Astro build. The GitHub website URL redirects to that custom domain.

GitHub's Pages API separately reports eco-slate-www built at its exact current main, legacy source main/root, CNAME eco-slate.org and domain verified. eco-slate's Pages API returns404 despite its retained CNAME and older Pages run history. There is no evidence of a second active Pages site in that repository. Two files alone do not prove competing live sites.

Payload equality is not an authenticated Netlify deploy ID, linked-repo identity or build-setting attestation. GitHub's green legacy Pages job is not proof of Astro build/deploy CI. Record the actual Netlify project, branch, command, publish directory and domain routing before future publication. No DNS/Pages/Netlify setting or historical CNAME was altered.

## eco-slate draft versus governance authority

README, docs, spec and registry README establish a documentation scaffold. Registry guidance describes metadata and validation expectations, but there is no concrete module catalog, machine entry format/schema or executable registry validator in the inspected source. v0.1 is partial; v0.2/v1.0 remain planned. Roadmap dates and acceptance decisions were not invented.

Draft statements that governance is enforced are design intent, not runtime enforcement proof. Governance Commons continues to own portable standards; this audit neither assigned new authority to eco-slate nor rewrote its specification. The old landing page's OCRAFT branding is a retained prototype, separate from the current Osprey/Kinjuu Astro site. README states CC-BY-4.0, but eco-slate lacks a root license payload; eco-slate-www has LICENSE.md. No license decision or legal interpretation was imposed.

## Website reality and bounded corrections

The committed package is Astro6.3.5 through its lock, Node>=22.12, with scaffold name astro-temp/version0.0.1. Exact-source npm ci and build succeed. Astro emits six routes: Home, Docs, Downloads, Dashboard, Dashboard/Oil, and the old Oil redirect. Root HTML/scripts and dashboards/personal, agrilogik and geopolitics are earlier prototypes; they are not automatically copied into this build. Coming-soon cards do not establish operational modules.

The successful build reproduced real live defects: Home lacked title/description metadata; Docs and Downloads were HTML fragments without a complete head or stylesheet. Docs linked to two nonexistent local section IDs. Corrections add explicit metadata/page frames, real preview section targets and a working fallback Learn more destination. No finished documentation/release catalog was fabricated.

A browser screenshot revealed a missing CSS token: styles used --white while palette.css defines --palette-white. The foreground references now use the existing defined token. Fresh-origin browser verification confirms readable body/heading color rgb(248,247,243); a cached earlier stylesheet was identified and excluded from the final proof.

Oil uses fixed sample prices, relative alert ages, chokepoint text and risk scores from oil-data.js. It has no observation timestamps or implemented market feed. The UI/fallback/meta and shared risk footer now explicitly describe fixed examples and planned live feeds. Values and historical source examples were preserved. The unused oil-news.js has a placeholder key and is not wired as an operational feed; no key or external API call was introduced.

The Oil preview is not shown to consume Signal Radar or EdgeLab. Signal Radar remains evidence-first event intelligence; EdgeLab remains downstream market-edge research/validation. No market facts were refreshed or trading conclusions drawn from sample cards.

Sign-in/trial and several shared navigation anchors remain prototypes. Personal OS, Agrilogik and Osprey Analytics cards remain coming-soon; Docs and Downloads remain preview pages. The bounded corrections do not certify all navigation, mobile behavior, authentication, billing, data ingestion or production readiness.

## Validation and remaining actions

- Before and after builds pass; six document-route checks changed from failing metadata/stylesheet/section targets to passing. This is a scoped output check, not a full application suite.
- All copied browser scripts pass syntax checks. Desktop-browser DOM/screenshots verify Docs metadata/styling/section IDs/foreground and real Oil module rendering with the sample notice.
- Locked npm audit reports12 affected packages:1 critical,10 high,1 low. Astro is directly flagged; applicability to this static deployment and the dev/build pipeline needs triage. No dependency upgrade was silently applied and no exploitability/compromise claim is made.
- Both root planning histories were preserved as byte-identical prefixes, appended with dated evidence. Public-source README and local ignored GC bootstrap routes were corrected. Historical docs/ planning/templates and nested checkout remain intact. Public runtime changes are bounded to page frames, sample labels, fallback destination and color-token repair.

Recovery order: (1) triage dependencies and capture Netlify build/deploy provenance; (2) add build/navigation CI and replace or explicitly label remaining prototype actions; (3) decide whether Oil belongs on this governance/ecosystem preview site and define real evidence contracts before any feed; (4) select a concrete eco-slate registry scope only if needed alongside existing GC contracts; (5) decide nested .eco adoption/update separately. Changes remain uncommitted and undeployed.

## Classification

| Class | Current evidence |
| --- | --- |
| CANONICAL | Distinct current source roots; root local planning authority; current website payload correspondence; GC ownership retained |
| IMPLEMENTED | Documentation scaffold, Astro routes, dashboard sample interface, redirect; bounded local page/style repairs |
| PARTIAL | Registry/schema/validation, roadmap completion, actual deploy provenance, feeds, public catalogs, navigation/auth/trial, dependency remediation |
| STALE | Starter README, duplicate-CNAME diagnosis, malformed page frames and undefined text-color token; corrected or annotated |
| SUPERSEDED | Website docs/ pre-migration planning and earlier static prototypes; historical sources retained |
| CHAT-ONLY | No extra Classic-only feature could be established; preview cards/roadmap ideas were not converted into implementation mandates |

Next portfolio reconciliation: eOS. The portfolio inventory remains74 rows; these two rows now have evidence-backed classifications rather than metadata-only status.

## Governance closeout

All nine Level1 validators pass; existing Level4 CXP4/canonical GC5/duplicate GC10 release gates remain open. Final PLAY validation accepts 30 records with zero errors/warnings. Reconciliation complete; local repairs have not been published or deployed.
