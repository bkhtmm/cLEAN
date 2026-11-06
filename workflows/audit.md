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

Use the project's documented build and checking commands where available. Record
each check's command, scope, result, and relevant diagnostics. Distinguish a source
failure from missing tools, unavailable dependencies, and exhausted resources.
Read [verification](verify.md) for build coverage, axiom checks, and the baseline
specification needed before later edits. If a full baseline check is outside
the budget, report what was checked and what remains unknown; do not silently substitute a smaller check for a full build.

A failed or unavailable baseline does not prevent inspection or planning. It does
prevent claims that the library is verified or ready for an unchecked migration.
Keep pre-existing failures visible so later work can distinguish regressions.

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

Do not confuse these cases:

- A simple lemma can be faithful and useful. Simplicity alone is not vacuity.
- A specialization, wrapper, or repeated statement may serve a real consumer.
  Identify that role before calling it duplication.
- A generally useful fact may need relocation and export rather than becoming
  private. Conversely, a proof-specific helper does not become general by moving
  it into a generically named module.
- A stronger theorem is useful when it preserves the original result and has a
  natural application. Extra parameters without a demonstrated use are not an
  improvement by themselves.
- A short proof is not necessarily robust; a long proof is not necessarily poor.
- A missing source limits a faithfulness judgment. It does not establish that the
  formalization is wrong or faithful.

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
2. Baseline checks, existing failures, and unperformed checks.
3. Claimed results and statement vocabulary, with their intended sources and any
   unresolved semantic questions.
4. The mathematical and dependency overview, distinguishing file imports,
   declaration dependencies when available, and an inferred task plan.
5. The findings, including confirmed issues and unresolved investigations.
6. Candidate structural directions and a bounded area suitable for a first repair
   experiment, without presenting that direction as an already-accepted redesign.

Use [Report](report.md) to present the findings, mathematical map, and actual
coverage at a useful level of detail. Label structural directions as proposals.

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
