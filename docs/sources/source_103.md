# Source 103

# === BEGIN SUMMARY BLOCK ===

## Links

- [ISO 9241-210:2019 human-centred design](https://www.iso.org/standard/77520.html)
- [NASA Human Integration Design Handbook (HIDH)](https://www.nasa.gov/human-integration-design-handbook/)
- [NASA-TLX workload measure](https://www.nasa.gov/human-systems-integration-division/nasa-task-load-index-tlx/)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [W3C Cognitive Accessibility Guidance (COGA)](https://www.w3.org/WAI/cognitive/)
- [Microsoft Guidelines for Human-AI Interaction](https://www.microsoft.com/en-us/research/project/guidelines-for-human-ai-interaction/)
- [NIST Human-Centered Design](https://www.nist.gov/itl/iad/human-centered-technologies/human-factors-human-centered-design)
- [International Ergonomics Association (cognitive ergonomics definition)](https://iea.cc/about/what-is-ergonomics/)
- [Human Factors and Ergonomics Society](https://www.hfes.org/)
- [ACM CHI / SIGCHI / TOCHI research ecosystem](https://chi2026.acm.org/)

## Article Details

### Human Interaction Evidence: HCI, Ergonomics, and Human-AI Interaction Standards for Cockpit, Lasso, eco, HELM, and Jäger-Modus

**Source:** ChatGPT research synthesis + Codex architectural review (2026-07-14, cross-agent synthesis)

**Summary:**
The human-interaction problem space for this portfolio is broader than UI/UX design: it
spans HCI, human factors engineering, physical/cognitive ergonomics, psychophysics,
accessibility, and human-AI interaction. A body of authoritative standards and research
already exists and should be incorporated into product design directly — this is
incorporation work, not novel research. Codex review verdict adopted: incubate as
"Human Interaction Evidence" in portfolio docs; a standalone `human-interaction-commons`
repo is premature until at least two products consume the same stable contract.

**Portfolio stance (2026-07-14, user decision):** this lane is learn-and-apply —
distill published standards into design guidance for eco, Cockpit, and Helm UI, and
adopt/adapt them into normal build work. The products are NOT research projects and
this changes nothing about current development plans. Study-type activities (mode
comparisons, telemetry, TLX-style workload prompts) are fair game, but only as
development tools and demonstration features — things the products do to get built
better and to show what they can do — never as a standing research program the
products serve. Applied guidance lives in
`lasso/docs/architecture/human-interaction-references.md` and
`cockpit/docs/architecture/human-interaction-references.md`. The measurement/study
material below is retained as a menu to pull from when it serves dev or demo.

**Standards to incorporate (per product):**

- **ISO 9241-210** — human-centred design process: user needs, context, accessibility,
  iterative evaluation across the whole lifecycle. Governs *how* all five products run
  their design loops; the portfolio-level process standard.
- **NASA HIDH** — closest existing analog to a comprehensive "hands, eyes, body, brain,
  controls, displays, workload" reference. Direct transfer to Cockpit (control placement,
  displays, alarms, labels) and HELM/Jäger-Modus (automation modes, human error, workload
  under precision-mode).
- **NASA-TLX** — structured workload measure (mental/physical/temporal demand, effort,
  performance, frustration). The default instrument for comparing Lasso workflow modes
  and Cockpit density modes.
- **WCAG 2.2** — minimum implementation baseline for Cockpit and Lasso surfaces: keyboard
  access, contrast, focus, motion, pointer targets (24×24 CSS px minimum).
- **W3C COGA** — cognitive accessibility: memory demand, attention, predictable behavior,
  comprehension. Informs Cockpit information density and Lasso guidance levels.
- **Microsoft Guidelines for Human-AI Interaction** — foundational reference for Lasso's
  collaboration layer: how an AI system behaves initially, during normal use, when wrong,
  and as it learns. Maps almost one-to-one onto agent initiative, correction, expectation
  management, and user control.
- **NIST HCD** — usability methods, human error, testing in demanding environments;
  effectiveness/efficiency/well-being framing for eco's enforcement telemetry.
- **ACM SIGCHI/CHI/TOCHI, HFES, IEA** — ongoing research feeds (ACM fully open access
  since 2026). Search anchors: adaptive user interfaces, mixed-initiative interaction,
  trust calibration in AI, automation bias, progressive disclosure.

**Ownership split (Codex, adopted — matches portfolio modularity law):**

- **Cockpit** owns host-level *presentation*: density, navigation, font scale, motion,
  input emphasis, themes, accessibility presentation, interruption display.
- **Lasso** owns human-agent *collaboration behavior*: agent initiative, explanation
  depth, approval gates, progress visibility, disagreement/correction, delegation,
  trust calibration.
- **eco** owns runtime *enforcement and telemetry* for consequential actions,
  confirmations, interruptions, agent behavior.
- **HELM** — session/mode governance surface: interaction-profile changes are mode
  changes and flow through HELM's existing mode-change/escalation machinery; sparse,
  event-driven governance checks (per source_68) apply to interaction adaptation too.
- **Jäger-Modus** — human-initiated precision mode: may override presentation defaults
  (density, interruption batching) under explicit human trigger, never silently.
- **Governance Commons** eventually owns only the portable evidence contract and
  conformance vocabulary — not product-specific UI rules.

**Human Interaction Profile — two layers, never merged:**

```yaml
interaction_profile:
  presentation:        # Cockpit-owned, portable across products
    information_density: balanced
    font_scale: 1.1
    motion: reduced
    guidance_level: contextual
    shortcut_discovery: progressive
  collaboration:       # Lasso-owned, requires product/runtime validation
    agent_initiative: suggest_before_acting
    explanation_depth: concise
    confirmation_level: consequential_actions
    interruption_policy: batch_noncritical
```

Invariant: a presentation change (theme, density, LCARS-style skin) must never silently
change confirmation requirements or agent initiative. Presentation preferences travel
across products; authority-sensitive collaboration settings are validated per runtime.

**Adaptation progression (adopted):**
accessible defaults → explicit personalization → suggested adaptation → reversible
automation. Adaptation must be inspectable (user can see why a suggestion was made);
no silent diagnosis of cognitive traits. Pattern: "You frequently use the command
palette. Would you like command-first mode?"

**Five-layer evidence model (Codex refinement, 2026-07-14):**

1. **Collection method** — the eight evaluation dimensions plus instruments (NASA-TLX).
2. **Evidence record** — source, population, task, device/context, method, limitations,
   confidence, findings, design implications, affected components.
3. **Product studies** — remain in Lasso and Cockpit (product-specific tasks, telemetry,
   observations, outcomes): `lasso/docs/research/human-interaction.md` and
   `cockpit/docs/research/human-interaction.md`.
4. **Portable findings** — graduate only when replicated or sufficiently supported
   across products.
5. **Commons contract** — eventually the evidence schema, vocabulary, graduation rules,
   and genuinely portable findings; never raw product research.

**Graduation test (explicit):** a finding may move toward Governance Commons only when
it is portable, evidence-backed, implemented or evaluated by at least two products, and
expressible without product-specific behavior or data.

**Sequencing (Codex, adopted):**

1. Evidence lane lives here in portfolio docs (this source is step 1).
2. Define the evidence-record schema.
3. Prototype interaction profile in Cockpit and Lasso separately.
4. Comparative studies (default vs compact/guided), NASA-TLX instrumented.
5. Promote proven portable pieces to Governance Commons.
6. Standalone commons repo only when ≥2 products consume the same stable contract —
   tightened: the contract must survive one breaking-change cycle unmodified across
   both consumers, not just simultaneous adoption at t=0.

**Non-obvious insight:**
The scope trap is "modeling the human" — HCI + ergonomics + psychophysics together are
an endless research program. The practical unit is: *for this task, on this device,
under these conditions, what interaction choice improves performance, comprehension,
control, accessibility, or workload?* Standards supply defaults and constraints;
product telemetry supplies the rest. Incorporation of existing standards (WCAG 2.2
targets, COGA predictability, MS HAI guidelines) is immediately actionable in Cockpit
and Lasso today with zero new research.

# === END SUMMARY BLOCK ===
