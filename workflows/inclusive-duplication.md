# Reduce inclusive Mathlib duplication

Apply only when the user explicitly selects `objective: inclusive-duplication`,
aggressive statement deduplication, or an inclusive duplication metric. Ordinary
cLEAN use defaults to maintainability and the [reuse rubric](../rubrics/reuse.md).
Apply this objective alongside the requested audit, plan, repair, or verification
workflow. It does not authorize repairs during an audit or change bounded/campaign
persistence or resource limits.

## Establish the metric and baseline

Identify the actual judge rubric, prompt/schema, eligible source set and filters,
searched dependency revisions, model/settings, and pass count. Preserve their
identities with the baseline sources and results. Reuse an existing evaluation
only when its inputs and provenance fit the comparison. When the judge or its
protocol is unavailable, continue source review and report metric verification
as unavailable; a manual classification is not a measured score.

Use the judge's distinctions and exclusions. An inclusive metric can count both
an equivalent statement (`duplicate`) and a specialization (`special_case`),
even when the local proof already calls the match. Respect its actual derivation
bound, such as one or two short lines using a single substantive declaration and
routine glue. A long compiled derivation establishes mathematical recoverability,
not necessarily compliance with that scoring rule. Reject circular matches and
compare against the exact dependency sources the judge permits; a result outside
the project's pinned dependencies may remain unavailable for migration.

Keep the complete cLEAN theorem inventory, including private declarations,
separate from the judge's eligible population. Map both to stable baseline IDs
in the [run records](../references/records.md#inclusive-duplication-records).
Scope, filters, and source ownership remain consistent through the comparison;
changing visibility, moving copies outside the scan, or adding unflagged padding
does not establish deduplication.

## Review overlap separately from implementation

For every eligible theorem in the declared scope, search its statement for a
Mathlib match, including unchanged one-line wrappers. Track separately:

- **Statement overlap:** judge verdict or manual candidate classification, exact
  located declaration, contract comparison, short derivation, and compile result.
- **Implementation:** direct delegation, indirect delegation through a helper,
  or an independent local argument. Follow helpers to inspect the actual reuse.
- **Disposition:** remove and migrate, retained exception, unresolved candidate,
  or no match found within the recorded search boundary.

Neither existing delegation nor a useful API/simp role closes a confirmed match
under this objective. Both may justify retention under default maintainability;
here they identify consumer work needed to remove the declaration. Judge output
is a lead requiring source comparison and a checked adapter, not authority to
delete a theorem. Inspect plausible more general formulations before treating
an unsuccessful name search as a negative result.

## Remove covered declarations and migrate consumers

For a confirmed match, prefer deleting the local declaration and using Mathlib
at its consumers with short instantiations, rewrites, or local proof steps.
Changing only the proof body leaves the statement eligible for the same flag
and is not completion of that removal task. Avoid replacing a removed wrapper
with an equivalent alias or exported helper that recreates the same overlap.

Locate explicit uses and automation roles, including simp/ext/grind attributes,
generated declarations, and relevant instances. Update affected proofs, imports,
examples, and documentation; build the consumers rather than inferring migration
from a name search. Account for heavier imports and cycles before accepting a
replacement. Preserve required behavior using the available Mathlib API.

Use the ordinary breaking-change policy, with documented mappings and all
affected in-repository consumers migrated. A stricter compatibility requirement,
an unavailable replacement import, or a demonstrated unsolved consumer obligation
can require retaining a covered declaration. Record the concrete constraint,
remaining flag, and pending work as an exception. Convenience, an existing caller,
or an API role alone is not an exception. An unproved contract fit remains a
candidate, not a confirmed removable match. Continue independent work when one
candidate cannot be accepted.

For every deletion, preserve the original quantified statement and definition
meanings, then compile a recovery witness using the replacement and no stronger
assumptions. Keep witnesses in designated verification evidence outside the
implementation population; they must not depend on the deleted theorem or an
alias/helper whose proof depends on it. Required main claims must remain
available or have checked recovery through the migrated API. Deleting a stronger
claim because only a weaker one matches does not preserve the mathematics.

## Measure and finish against the objective

Run the same judge protocol on the final candidate within the run's execution
and resource limits. Record actual baseline/final flag counts, eligible counts,
and rates, plus removed, added, and surviving declaration mappings. Show verdict
transitions on matched survivors separately: a removed declaration is not a
new `none_found` judgment. Reconcile removed claims with their recovery witnesses
and migrated consumers. Newly introduced eligible declarations must be evaluated
too; unrelated additions must not dilute the reported comparison.

Keep three outcomes separate: verified declaration removals, proof-step reuse,
and measured judge reduction. A successful build, fewer lines, a shorter proof,
or fewer manually predicted flags does not establish a measured reduction.
Record protocol/model differences and judge flips on unchanged declarations;
a single pass does not establish repeatability. Refresh only comparisons whose
inputs changed, rather than repeatedly judging unchanged snapshots to seek a
better score.

Finish the declared review with each confirmed match removed and verified or
explicitly retained as an exception, and candidates/gaps still visible. Report
whether the measured result meets the user's reduction or threshold target.
If evaluation is unavailable or the score does not improve, report that objective
as unverified or unmet even when the patch is otherwise verified. Apply the
ordinary campaign closure conditions when campaign mode was selected; a zero
score is required only when the user requested that target. Do not invent
unrelated changes to force a target when no supported repair remains.
