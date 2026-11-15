# Review duplication during normal cleanup

Use with the [reuse rubric](../rubrics/reuse.md) during ordinary audit, planning,
repair, and verification. Duplication review serves maintainability: find overlap,
reuse existing mathematics, retain justified interfaces, and remove redundancy
when migration improves the library. The review includes statements whose proofs
already delegate to Mathlib. No separate selection is needed, and audit/plan
requests still leave sources unchanged.

## Establish the review baseline

Use the declared review scope, pinned dependency source map, preserved claims,
and stable theorem IDs from the [audit](audit.md#theorem-coverage). Execute the
reuse rubric's applicable searches against pinned Mathlib and local sources.
Inspect contracts and promising more general formulations; an unsuccessful name
search does not establish that no replacement exists. Reject circular matches
and candidates unavailable under the project's dependency and import constraints.

## Review statements, implementations, and interfaces separately

For each theorem in the declared reuse-review scope, record:

- **Statement overlap:** exact located match, contract comparison, derivation or
  adapter, and compile result. Keep suspected matches distinct from confirmed ones.
- **Implementation:** direct delegation, indirect delegation through a helper,
  or an independent argument. Follow helpers to inspect the actual reuse.
- **Interface role:** mathematical purpose, automation, documented uses or
  compatibility requirements, weighed against import and maintenance costs.
- **Disposition:** replace the implementation and retain the interface, remove
  and migrate, retain with justification, investigate a candidate, or no match
  found within the recorded search boundary.

A useful wrapper can be accepted while remaining a known statement overlap.
Its role does not by itself justify an independent re-proof when a suitable
existing implementation can serve it. Conversely, mathematical derivability
alone does not establish that deleting the interface improves the library.
Judge output, when available, supplies leads to verify rather than authority
to delete declarations or dismiss useful interfaces.

## Choose and verify the repair

Apply the [reuse retention criteria](../rubrics/reuse.md#decide-whether-keeping-the-declaration-serves-a-purpose).
Delegate a proof to a suitable existing result while retaining an interface whose
role justifies its cost. Remove a declaration when it adds no justified separate
role or when a demonstrated migration improves the interface and its consumers.
Record the tradeoff; do not delete a useful wrapper merely because a judge flags
its statement. An unproved contract fit remains a candidate.

Locate explicit uses and automation roles, including simp/ext/grind attributes,
generated declarations, and relevant instances. For changed or removed interfaces,
update affected proofs, imports, examples, and documentation. Build the consumers
rather than inferring migration from a name search. Account for heavier imports,
cycles, and compatibility requirements before accepting a replacement. Avoid
recreating an unjustified redundant interface under a new alias or helper name.

For a deletion, preserve the original quantified statement and definition
meanings, then compile a recovery witness using the replacement with no stronger
assumptions. The witness must not depend on the deleted theorem or a circular
alias/helper. Keep witnesses in designated verification evidence; when measuring
implementation duplication, exclude them consistently from that population.
Required main claims must remain available or have checked recovery through the
migrated API. A weaker matching claim cannot replace a stronger original one.

Use [Verify](verify.md) for proof replacements, original-claim recovery, trust,
automation, and integration checks. Record verified proof reuse separately from
declaration removals. Retained interfaces need their reasons documented; pending
implementation work and unavailable checks remain visible. Continue independent
work when a candidate cannot be accepted.

## Measure duplication when requested

Numerical evaluation is optional and does not change the retention criteria.
If requested, identify the judge rubric, prompt/schema, eligible source set and
filters, allowed dependency revisions, model/settings, and pass count. Preserve
these with baseline sources and results before editing. Reuse an evaluation
only when its inputs and provenance fit the comparison. An unavailable judge
leaves the requested measurement unavailable, without preventing source review
or independently verified repairs.

Use the judge's actual distinctions and exclusions. An inclusive metric can flag
both an equivalent statement (`duplicate`) and a specialization (`special_case`),
even when its proof already calls the match. Respect its derivation bound, such
as one or two short lines using one substantive declaration and routine glue.
A long compiled derivation establishes recoverability, not necessarily a match
under that scoring rule. Keep judge verdicts distinct from manual classifications.

Keep the complete cLEAN theorem inventory, including private declarations,
separate from the judge's eligible population, and map both to stable IDs in the
[duplication records](../references/records.md#duplication-review-records). Keep
scope, filters, and source ownership consistent. Changing visibility, moving
copies outside the scan, or adding unflagged padding is not deduplication.

Run the same protocol on the final candidate within the resource limits. Report
actual baseline/final flag counts, eligible counts and rates, and removed, added,
and surviving declaration mappings. Evaluate newly introduced eligible declarations;
unrelated additions must not dilute the comparison. Show verdict transitions on
matched survivors separately: a removed declaration is not a new `none_found`
judgment. Reconcile deletions with recovery witnesses and migrated consumers.

Keep verified declaration removals, proof-step reuse, justified retained overlaps,
and measured score changes separate. A retained wrapper may still be flagged
after its proof improves; record the actual result rather than predicting a
reduction from shorter code or successful builds. Record protocol differences
and flips on unchanged statements; a single pass does not establish repeatability.
Do not repeatedly judge unchanged snapshots to seek a better score.

## Finish the duplication review

For each confirmed overlap, record a verified repair or an evidence-backed
retention decision, with candidates and search gaps still visible. Justified
retention can resolve an interface question while implementation work remains;
accept that repair only after its own checks pass. For whole-repository or broad
multi-area work, also apply the [closure checks](campaign.md#close-against-evidence)
to the declared scope.

When evaluation was requested, report separately whether its measurement or
threshold target was met. An unavailable evaluation or unmet score target leaves
that deliverable unavailable or unmet, even when maintenance repairs are verified.
A useful retained overlap is not automatically a maintenance defect, and no
implicit zero-flag target applies. Do not invent unrelated changes or delete
useful APIs merely to force a score.
