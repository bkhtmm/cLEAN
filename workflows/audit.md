# Audit an existing Lean library

Read the operating contract in the main skill before this workflow. Produce an
evidence-backed assessment that a planner can use. This is a whole-library or
bounded-library assessment, rather than a review limited to a pull request diff.

Keep the target's source, configuration, and dependencies unchanged during the
audit. Existing build commands may produce their normal build artifacts. Save
reports and command logs in the user's designated working location, or a clearly
identified local run directory. Inspection does not authorize a repair.

## Establish the scope and baseline

Record:

- The target path and repository revision, including relevant uncommitted changes.
  If Git is unavailable, identify the source snapshot without inventing a revision.
- The requested modules, mathematical area, or whole-repository scope; available
  time or compute limits; and the actual coverage of this audit.
- The pinned Lean toolchain and dependency versions, the project's build targets,
  existing checks, and any stated axiom and compatibility policies.
- The claimed main results, their locations, the definitions their statements use,
  and the sources or project documentation that describe the intended mathematics.

Before reuse review, resolve the project's and pinned dependencies' searchable
source roots using [reuse source discovery](../rubrics/reuse.md#locate-the-sources-to-search).
Check source availability and dependency identity; a path in a manifest is not
evidence that those sources were searched. Keep one source map for the run and
refresh it when its inputs change.

Before edits, capture the theorem inventory below and the baseline
[measurements](../references/records.md#measurements). Preserve the counted source
set, source snapshot, and counting method for the final comparison. An audit or
plan records findings and baseline scale, not repairs it has not performed.

Use the project's documented build and checking commands where available. Record
each check's command, scope, result, and relevant diagnostics. Distinguish a source
failure from missing tools, unavailable dependencies, and exhausted resources.
Read [verification](verify.md) for build coverage, axiom checks, and the baseline
specification needed before later edits. If a full baseline check is outside
the budget, report what was checked and what remains unknown; do not silently substitute a smaller check for a full build.

A failed or unavailable baseline does not prevent inspection or planning. It does
prevent claims that the library is verified or ready for an unchecked migration.
Keep pre-existing failures visible so later work can distinguish regressions.

Assess [build health](../rubrics/build-health.md): compare the pinned Lean/Mathlib
pair with recent compatible stable releases and assess the baseline warnings.
Record version constraints and warning exceptions with evidence. Keep upgrade
findings separate from permission to change dependencies, and distinguish a
successful build from a warning-free one. State any unperformed comparison or
unchecked build targets.

## Map the mathematical structure

Build a useful overview within the audit's scope. Identify:

- Mathematical objects, their definitions, and the interfaces used by consumers.
- General infrastructure, application-specific proof machinery, and examples.
- The main import relationships and high-impact shared declarations.
- Definitions needed to understand the main statements, including proof-heavy
  dependencies imported merely to access that vocabulary.
- Existing abstractions in the repository and its pinned Mathlib that may already
  cover material implemented locally.

Use actual definitions, imports, uses, and sources to support this map. Names and
folder prefixes are clues, not evidence that two files share a mathematical topic.
For a large repository, inventory broadly and inspect representative dependency
chains in depth. State which areas remain unexamined.

## Inspect through the quality angles

Use the [Shared review rules](../rubrics/_common.md) and the applicable detailed
rubrics linked from [the skill entry point](../SKILL.md#review-quality). Inspect
integrity first where it could invalidate a proposed repair. Then inspect APIs,
reuse and generality, mathematical placement and dependencies, names,
documentation, attribution, and proof robustness. These are complementary views,
not independent scores to average. Record an unreviewed angle as unreviewed.

For a large repository, distinguish a broad inventory from a deep semantic
review. Select chains from main results down through their statement vocabulary
and shared infrastructure, including high-impact consumers and suspicious
assumption boundaries. State why that sample is informative. Do not call reading
a few attractive leaf lemmas a whole-repository semantic audit.

The representative semantic inspection above does not substitute for the two
individual checks in [theorem coverage](#theorem-coverage). Apply the relevant
rubrics to definitions and other public/shared interfaces too; keep their review
boundary visible without counting them as source-authored theorems.

When [delegation](coordinate.md) is available, authorized, and worthwhile, assign
independent work or focused reviews—such as assumption minimization or Mathlib
reuse—to separate agents, and verify their findings before integration.

Do not confuse these cases:

- A simple lemma can be faithful and useful. Simplicity alone is not vacuity.
- A specialization, wrapper, or repeated statement may serve a real consumer.
  Identify that role before calling it duplication.
- A generally useful fact may need relocation and export rather than becoming
  private. Conversely, a proof-specific helper does not become general by moving
  it into a generically named module.
- A simpler existing contract can justify a proportionate assumption reduction;
  broader abstractions need a natural purpose. Recover the original result in
  either case. Extra parameters alone are not an improvement.
- A short proof is not necessarily robust; a long proof is not necessarily poor.
- A missing source limits a faithfulness judgment. It does not establish that the
  formalization is wrong or faithful.

## Theorem coverage

For a broad library audit or cleanup, give every in-scope source-authored theorem
or lemma its own [review record](../references/records.md#theorem-review), including
private declarations and unchanged code. A focused repair covers changed and
affected declarations; an explicitly sampled audit states its selection and
cannot claim full theorem coverage. This depth is independent of persistence mode.

1. **Establish the inventory.** Enumerate project-owned Lean sources and their
   theorem/lemma declarations at the baseline snapshot. Record inclusion rules,
   exclusions, enumeration method, and limits. Exclude dependency packages and
   generated auxiliaries explicitly. Prefer available Lean-aware source or
   declaration tooling; reconcile its output with source locations, including
   private names, section/namespace context, and project declaration syntax.
   A line-based name search alone does not establish a complete inventory.
   If completeness cannot be established, retain the known entries and label the
   census and coverage partial. Assign stable IDs before edits.
2. **Review each contract.** Use [generality](../rubrics/generality.md) to recover
   actual binders and instances and ask which hypotheses can be removed entirely.
   Track weakening or broader abstraction separately. Use
   [reuse](../rubrics/reuse.md) to search pinned Mathlib and local mathematics for
   replacements, applying its declaration, proof-step, construction, and local
   repetition searches where relevant. Link executed search evidence and record
   the interface's purpose. Examine the proof, definitions, relevant instances,
   and consumers as needed; individual attention does not mean judging an
   isolated statement.
3. **Return two individual outcomes.** For each ID, record assumption and reuse
   coverage separately, with a reason and evidence or a linked finding. Coherent
   file/API batches can share context and search evidence, but every theorem
   needs its own conclusion. A batch-complete message or file-level verdict
   cannot fill missing outcomes. No issue found means only within that review's
   depth and search boundary; unresolved candidates remain visible. A no-issue
   outcome cannot close missing applicable searches or unavailable relevant
   sources. Leave that reuse review unreviewed with its gap; report positive
   findings supported by the evidence already obtained.
4. **Investigate supported candidates.** Test concrete weaker signatures and
   replacement adapters in the pinned environment before accepting repairs.
   Record compiled checks separately from reviewer judgments. Useful wrappers
   may retain their interface while delegating the proof; substantial unproved
   generalizations remain investigations or deferred work. There is no zero-flag
   target and no requirement to invent a change for every reviewed theorem.
5. **Maintain and reconcile coverage.** Use the inventory during cleanup and
   finish unreviewed entries before final verification. Map moves, renames,
   removals, splits, and merges; add new helper theorems. Reopen affected outcomes
   when signatures, definitions, instances, proof dependencies, consumers, or
   available replacement APIs change. Unchanged theorem text alone is insufficient
   evidence of validity. Apply the final
   [reconciliation](verify.md#reconcile-theorem-coverage), including for an audit
   with no source edits.

Use available tools or a run-local check to compare inventory IDs with current
review records and record its result. This Markdown workflow supplies no bundled
census/checker or automatic enforcement. Reconciliation detects missing or stale
records; it does not prove that a model's mathematical judgment is correct.

## Record findings for handoff

Use the canonical [finding record](../references/records.md#finding) with stable
IDs. Include located evidence, confidence, affected consumers, a material
consequence, a proposed repair or investigation, and its acceptance evidence.

Group repeated instances when one shared change addresses them. Keep findings
with different causes or acceptance conditions distinguishable. A candidate
finding is an investigation task, not an instruction to perform an unproven fix.

Search the available repository and pinned dependencies before naming a
replacement. Failure to find one is not proof of its absence. Attribute judgments
to the evidence inspected rather than presenting a reviewer's preference as a
mechanical failure.

## Deliver the audit

Return a report containing:

1. Scope, revision, toolchain, policies, and coverage limitations.
2. Baseline checks, existing failures and warnings, version freshness assessment,
   documented exceptions or constraints, and unperformed checks.
3. Claimed results and statement vocabulary, with their intended sources and any
   unresolved semantic questions.
4. The mathematical and dependency overview, distinguishing file imports,
   declaration dependencies when available, and an inferred task plan.
5. The findings, including confirmed issues and unresolved investigations.
6. Candidate structural directions and a bounded area suitable for a first repair
   experiment, without presenting that direction as an already-accepted redesign.

Use [Report](report.md) to present the findings, mathematical map, and actual
coverage at a useful level of detail, including numerical coverage for both
theorem checks, findings by disposition, and baseline measurements. Label
structural directions as proposals and integrated repair counts as zero for an
audit-only run.

State whether the scoped audit is completed, partially completed, or blocked, and
why. Keep that status separate from the condition of the audited library.
For requests that include recommendations, pass the report to
[Planning](planning.md); do not begin applying its proposed changes in audit mode.

## Design sources

- [TauCeti review angles](https://github.com/TauCetiProject/TauCetiReview/tree/main/rubrics):
  evidence-based judgments about meaning, APIs, reuse, placement, and proof quality.
- [Resolution's refactoring account](https://resolution.org/post/formalizing-resolution-of-singularities):
  whole-library organization and the separation of statement vocabulary from
  proof machinery.

These sources inform the design. Their project-specific policies do not override
the cLEAN operating contract or the target project's explicit requirements.
