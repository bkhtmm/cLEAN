# Validation history

Date: 6 November 2026. Skill: `0.2.0-draft`. Two independent agent executions
received the skill and raw target fixtures without the evaluator criteria.
The parent reviewed the resulting patches, probes, logs, and reports. Both used
the locally installed pinned Lean `v4.34.1`; no Mathlib, new toolchain, external
comparator, public service, or nested agent team was used.

## Bounded repair: passed

The worker extracted `Mini.double` and its existing `[simp] double_zero` into a
small public module, retained the sample theorem, and replaced the redundant
associativity wrapper with the located `Nat.add_assoc`. It preserved the
original fixture consumer and added a simplification use.

Baseline/candidate builds passed. An independently preserved definition matched
the candidate by checked equality; the original main claim was recovered.
A synthetic consumer importing only the new API used `simp` without unfolding
and retained computation at a concrete argument. Checked declarations remained
axiom-free, and toolchain/configuration/specification contents were unchanged.
No build-time improvement was claimed.

## Changed definition: correctly rejected

Both baseline and candidate built, with no axioms in the zero theorem. The
worker nevertheless rejected the candidate: kernel-checked counterexamples at
2 and 3 showed that its predicate denoted multiples of three instead of even
numbers. The same synthetic original-interface consumer passed baseline and
failed candidate. Source/configuration hashes were unchanged during review.

An initial fixture proof used bare `decide` where the pinned compiler required
explicit unfolding. That construction error was corrected identically in both
fixtures, and the final actual-module checks ran on fresh identified snapshots.
The initial failed builds were not counted as passing evidence.

## Static checks and follow-up

The bundled skill validator passed after its YAML dependency was provided in a
disposable validation environment. Local Markdown links/anchors, frontmatter,
UI metadata, workflow/rubric routing, nonempty files, and portable paths were
checked. The published skill itself needs no Python dependency.

The repair worker found instruction reading substantial for a tiny target. The
entry point now explicitly permits an inline baseline/plan and focused reading
for small repairs. Record guidance also clarifies current versus historical
state. Those small documentation clarifications were statically checked; the
two behavioral executions were not repeated after them.

For version 0.2, only the first two behavioral cases in the evaluation guide
were executed.
Real Mathlib refactoring, large-repository coverage and cost, unavailable-tool
environments, and multi-agent integration remain pilot work. These results
support a testable first draft, not a general reliability claim.

## Version 0.3 campaign resume: passed

An independent agent resumed a campaign whose initial bounded batch was already
accepted but whose second mathematical area remained unreviewed. It verified the
saved source identity, inspected the coverage gap, located a redundant helper
in the pinned Lean core, and migrated its consumer without reopening the earlier
accepted design. Only the second area's source file changed.

Baseline/final builds, changed-module build, preserved-definition and original-
claim probes, public-module consumer probes, and axiom checks passed. All five
Lean files and supplied specification/configuration were reviewed across the
quality angles. A separate self-review recorded closure at this small scope;
the preserved baseline and toolchain/configuration remained unchanged. The
parent inspected the patch, checked probes/logs, and reviewed the final records.

This executes the resume/discovery/closure variation of case 8. Budget-exhausted
and audit-only campaign variants, automatic host continuation across multiple
turns, large repositories, and multi-agent campaign integration have not been
behaviorally tested. The result establishes a small workflow pilot, not a
runtime guarantee or general proof of campaign reliability.
