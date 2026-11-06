# Build and dependency health

Use the [shared review rules](_common.md). Assess whether the build environment
supports maintenance and downstream reuse. A reproducible pin and a successful
build are evidence, but do not establish version freshness or warning absence.

## Assess Lean and Mathlib freshness

Locate `lean-toolchain`, the resolved Mathlib revision in the dependency manifest,
and the Lake configuration. Compare the actual pair with recent compatible
stable Lean/Mathlib releases using upstream release records. Record the comparison
date and source links; do not infer a Mathlib version from Lean's version alone.
If the project does not use Mathlib, assess Lean and mark the Mathlib comparison
not applicable.

Assess the lag against the project's support policy, intended downstream users,
and migration constraints. Flag material lag with its reuse or maintenance
consequence: for example, an old release candidate after matching stable releases
are available, or a pin that prevents use alongside the Mathlib version consumers
need. Explain the strongest relevant reason to retain the pin. Do not require the
latest release candidate or impose an arbitrary age or release-count cutoff.

Keep assessment separate from upgrading. Report justified upgrade findings even
when dependency changes are outside the requested cleanup; leave pins unchanged
unless upgrading is in scope. A proposed newer pair is not verified compatible
with the project until its required builds and checks have run against that pair.
If release records or consumer requirements cannot be checked, record the missing
evidence and use candidate or unresolved status rather than declaring freshness.

## Require warning-free builds within scope

Inspect the actual build and configured linter diagnostics for the requested
targets, including relevant targets outside the default build. Require zero
warnings in that scope unless the effective project policy documents justified
exceptions. Record each exception's diagnostic, scope, and reason; distinguish
such an accepted exception from a literally warning-free build.

Record pre-existing warnings as well as new ones. A zero exit status, unchanged
warning count, or passing configured linters does not establish warning absence.
Locate diagnostics and distinguish project warnings from dependency warnings;
identify which can be repaired within scope. Group repeated warnings with a
shared cause, keeping proof holes under the trust checks in
[verification](../workflows/verify.md#check-proofs-and-trusted-assumptions).

Use logs tied to the checked snapshot and build configuration. A cached or no-op
build with no diagnostics is not by itself evidence that elaboration is
warning-free; reuse applicable diagnostic logs or rebuild the relevant targets
when needed. Report unavailable coverage instead of forcing an unrelated full
dependency rebuild. Do not suppress diagnostics, disable linters, or exclude
files merely to make the check pass.

A bounded repair can leave unrelated baseline warnings outside its acceptance
scope, with those findings still open. It cannot support a warning-free claim
for the wider repository. An audit that finds warnings can still be complete;
the build-health check has not thereby passed.

## Evidence and acceptance

Use the canonical [finding record](../references/records.md#finding). For version
findings, include the actual pins, dated upstream comparison, affected reuse or
maintenance task, retention constraints, and a proposed compatible pair or bounded
investigation. For warnings, include the command and targets, configuration,
located diagnostics, baseline/new distinction, and any policy exceptions.

Record validation separately from confidence. Acceptance needs the scoped builds
and configured checks, warning results, and preservation evidence appropriate to
the repair. For an authorized upgrade, identify and check the new Lean/Mathlib
pair; otherwise retain the upgrade as a separate finding. Report warning-free
status, exception-qualified acceptance, and unperformed checks explicitly.
