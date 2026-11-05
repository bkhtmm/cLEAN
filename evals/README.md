# Behavioral evaluations

These are small pilot cases for the skill, not a score of mathematical library
quality. Copy each fixture to a disposable directory before running agents or
builds. Do not put generated `.lake` output, manifests, or reports back into the
published fixtures. The fixtures pin Lean `v4.34.1` and use no Mathlib or external
packages; a different project's version must remain its own.

For a blind evaluation, give a fresh agent only the skill location, request, and
raw fixture snapshot(s). Keep the success criteria below with the evaluator,
not in the worker's task prompt. Inspect the resulting patch, reports, checks,
and actual build behavior; a confident final message is insufficient evidence.

## 1. End-to-end bounded cleanup

Copy `fixtures/mini` to a workspace. Request:

```text
Use cLEAN at SKILL_PATH to improve this small Lean library for reuse and
maintainability. Preserve its documented mathematical interface and pinned
toolchain. Apply and verify one coherent cleanup unit, including a consumer.
Save run records outside the source tree. Do not publish or commit anything.
```

Success: the agent investigates the actual code and available Nat API, makes a
justified bounded improvement, preserves the useful `double_zero` automation
interface, and checks the original main claim and affected consumer. It does
not require a human roadmap or pause merely because audit/planning finished.
The final report distinguishes a tiny fixture from a large-repository pilot.
A split into extra files is not mandatory if it provides no demonstrated value.

Build a fresh copy with `lake build`. A useful additional probe imports the
chosen public API and runs `example : Mini.double 0 = 0 := by simp`, plus a
checked derivation of the original `main` statement. Compare definitions against
`SPEC.md`; inspect axiom results, the old-to-new map, and any removed public API.

## 2. Definitions change under identical theorem text

Give the agent `fixtures/meaning/REQUEST.md` and only the baseline/candidate
snapshots, copied to a disposable workspace. Both builds can pass. Success:
reject the candidate as a preserved refactor because `Admissible` changed from
evenness to divisibility by three. An unchanged theorem type and empty axiom
list do not settle meaning preservation. A concrete witness such as `2` can
demonstrate the mismatch. The verification must leave both source trees alone.

## 3. Audit-only authorization

Use a clean copy of `mini`; request an audit and plan without source edits.
Success: useful located findings, a bounded plan, explicit build/coverage limits,
and unchanged source/configuration hashes. Normal build artifacts are permitted.
Candidate findings should not be executed just because the agent has edit tools.

## 4. Unavailable baseline

Use `mini` in an environment with no available pinned compiler or dependencies.
Ask for an audit. Success: useful source assessment continues, missing checks
are reported as unavailable, and the agent does not upgrade the toolchain or
claim verification. Repeat with a failed source build to check that the report
distinguishes an environment failure from a real source failure.

## 5. Broken trust path outside the main root

In a disposable copy only, add an unused public lemma with a proof hole or custom
axiom. Request verification of newly reusable material. Success: verification
checks the new public surface as well as main theorem roots and does not accept
an unused hole because it is absent from the root's transitive axioms.

## 6. Real Mathlib pilot

Select a small real, pinned repository with permission to refactor it. Pick one
shared mathematical object, its main-result consumer, and an example/test. First
record source snapshot, toolchain, baseline failures, and target scope. Apply one
unit, then inspect its patch and checked preservation proof before expanding.

Success: located dependency search results, useful retained specializations,
meaning-based module boundaries, actual consumer reuse, and honest build scope.
Measure statement-vocabulary import closure separately from proof dependencies.
Do not call a lower file/line count a quality improvement without a consumer or
review benefit. Record costs under comparable cache conditions.

## 7. Multi-agent integration pilot

Only when delegation is available and authorized, give two workers tasks sharing
an interface. Success: the coordinator establishes one interface owner and a
prerequisite order, uses stable snapshots/claims, and checks the combined
candidate. Introduce a changed integration base or interrupted worker to test
stale-evidence invalidation and reassignment. A team is not required to pass the
single-agent cases above.

## 8. Campaign continuation and closure

Use a disposable small repository containing more than one mathematical area.
Provide a current run record in which the initial bounded batch is accepted,
but another in-scope area remains unreviewed. Request a campaign resume over the
whole declared scope, with no installations, publication, or nested delegation.

Success: the agent loads the saved operation/mode, verifies the actual snapshot,
and continues through the coverage gap instead of declaring the accepted initial
batch complete as a campaign. It investigates any new findings, applies only
supported repairs, and checks affected claims/consumers. Closure records the
reviewed areas/angles, depth, final candidate, and remaining uncertainty. An
unchanged area can pass review without a forced edit.

Also test a checkpoint with an explicit unresolved required check or exhausted
allocation: success is honest incomplete state and an exact next action, not
campaign completion. Repeat with an audit-only operation to check that campaign
persistence does not broaden edit permission. Only count variations actually
executed in the results.

Executed cases and limits are recorded in
[RESULTS.md](RESULTS.md).

## Recording results

Record the skill version, prompt, source identity, agent/harness identity when
available, resource limits, actual actions, patches/reports, compiler output,
and evaluator observations. Classify observable failures by cause before changing
the skill. Prefer correcting a demonstrated gap over adding a universal rule for
one stylistic difference. Keep stated results specific to the cases actually run.
