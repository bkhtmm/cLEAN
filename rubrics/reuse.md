# Reuse and duplication

Use with the [Shared review rules](_common.md). Assess whether the scoped
library builds effectively on existing mathematics and exposes genuinely shared
reasoning. The goal is a useful mathematical interface with less duplicated
maintenance, not the smallest possible collection of declarations.

## Locate the sources to search

Resolve paths against the target Lean checkout, not this skill's folder. Read
`lean-toolchain`, `lake-manifest.json`, and `lakefile.lean` or `lakefile.toml`,
including effective dependency overrides. Record the actual searchable roots:

- **Project:** the project's Lean source directories, including local helpers
  outside the file being reviewed. A narrow edit scope does not limit replacement
  discovery to that file; keep source changes within the authorized scope.
- **Mathlib:** normally `<target>/.lake/packages/mathlib/Mathlib/`. When reviewing
  Mathlib itself, use its own `Mathlib/` directory. Resolve custom package/source
  directories, path dependencies, and symlinks rather than assuming this default.
- **Other dependencies:** relevant package source directories. Include the matching
  Lean core or Std sources when the operation belongs there; these may be under
  the pinned toolchain's `src/lean/Init/` and `src/lean/Std/` directories.

Verify that the roots contain readable `.lean` sources and identify the dependency
revisions and relevant local modifications actually searched. A manifest entry
alone does not establish that the local checkout matches it. If needed, obtain
the exact pinned dependency sources in an isolated run directory. Do not run
`lake update` or change the target's dependency files to enable a reuse search.
Record missing or mismatched sources as a review limit. Online documentation or
search services can supply leads; validate them against the pinned sources.

## Execute searches for each applicable kind of reuse

Use `rg`, `grep`, or an equivalent code-search tool. Reading the target or recalling
a familiar theorem does not substitute for searching available sources. Search
both project and relevant dependency sources; a useful replacement need not be
in the current imports or the same subject directory.

For a conventional layout, these are example commands from the target checkout.
Replace `MyProject` and the dependency path with the resolved roots; the example
identifiers illustrate a constructor search, not required queries for every run.

```sh
rg --files --hidden --no-ignore -g '*.lean' MyProject .lake/packages/mathlib/Mathlib
rg -n --hidden --no-ignore -g '*.lean' -e 'ofSupportFinite' -e 'onFinset' MyProject .lake/packages/mathlib/Mathlib
```

The file listing checks what will be searched. A plain recursive search from `.`
can skip hidden or ignored dependency sources. Search explicit source roots to
avoid build artifacts and unrelated packages; resolve linked source directories
explicitly if the search tool does not traverse them. With another tool, check
its file coverage rather than copying `rg` flags.

Apply these searches to the declared review scope, including private helpers and
unchanged code in a broad cleanup:

- **Each declaration:** search for the same mathematical content, including a
  more general result specialized to the target. Short declarations still count.
- **Each proof with substantial intermediate reasoning:** search the final goal
  and its key intermediate claims separately. In particular, investigate manual
  image/preimage calculations, finite-support bookkeeping, and `Fin` case splits.
- **Each definition assembled from low-level pieces:** search for an existing
  constructor, combinator, or general construction that performs the assembly.
- **Each substantial proof or construction block:** search project sources for
  distinctive operations and argument patterns to locate repeated reasoning.
  Also inspect restated public facts, bundles of existing facts, and proofs
  assembled from consequences already supplied by component simplification lemmas.

Start with the proof's dependencies and underlying operations. Search bare name
fragments as well as qualified identifiers: namespaces may be declared separately,
and statements may span lines or use different notation. If an initial search
finds no fit, investigate equivalent formulations, symmetry/duality, bridging
lemmas, and the more general algebraic, order-theoretic, or categorical API.
Inspect promising declarations in context, including section variables and
instances; a hit list or a similar name does not establish a match.

When useful and available in the pinned environment, supplement source searches
with `exact?` or `apply?` in an isolated probe. These search its loaded environment,
not all unimported dependency sources. Generated declarations may also need Lean
inspection rather than a literal name match. Reject the reviewed declaration
itself and any candidate whose proof depends on it; importing the target into a
probe can rediscover the very theorem being reviewed. Check proposed imports for
dependency cycles before treating a local result as an available replacement.

## Make search completion visible

Link the source roots/revisions, executed queries, relevant hits or explicit
no-hit results, and why promising candidates fit or fail. Shared searches can
support a coherent group of declarations; explain which checks they cover.
An error, an empty source tree, or truncated output is not a completed negative
search. Narrow or repair the search, or leave the affected review incomplete.

A no-issue outcome requires the applicable searches above and inspection of
plausible candidates. If time or missing sources prevent that, record the gap
rather than marking reuse fully reviewed. A positive finding can still stand on
its located evidence. No fixed query quota or exhaustive search is required;
state the meaningful boundary and unresolved leads. An unsuccessful bounded
search does not establish that no replacement exists.

## Establish that a replacement actually fits

For a located replacement, compare the contracts: quantified variables,
universes, types, hypotheses, typeclass requirements, conclusion, and relevant
edge cases. Names and similar proof bodies are insufficient. A one-directional
implication does not replace an equivalence; an equal-length list theorem does
not replace a contract that deliberately handles unequal lengths.

Show the instantiation, rewrite, or short adapter that recovers the original
claim. Compile a focused witness using the pinned toolchain when practical,
without changing the audited source. Record the exact result and any unavailable
checks. A replacement that needs a stronger assumption or extra trusted axiom
does not establish the proposed preservation.

For definitions, compare the denoted objects and how consumers use them. If the
representation changes, explain the relationship needed to preserve meaning and
the interface migration it entails. Coincidentally definitionally equal types in
different mathematical roles are not automatically interchangeable public APIs.

For an extraction, identify the repeated reasoning, the proposed shared
statement, and the consumers that would use it. Preserve the applicable
generality and semantics. Explain the maintenance benefit relative to the new
abstraction and its dependencies. Do not introduce a generic helper merely to
factor two short expressions that express different operations.

## Decide whether keeping the declaration serves a purpose

Successful derivation from existing mathematics is necessary evidence for many
reuse proposals, but it is not sufficient reason to delete a public declaration.
Decide separately whether to retain the interface and whether to retain its
independent implementation. A useful wrapper can delegate to existing mathematics;
its API role alone does not justify re-proving that mathematics. Weigh the actual
clarity, import, and maintenance costs of the adapter rather than line count alone.
Check whether it provides:

- A characteristic API lemma that hides the implementation of a new definition.
- A useful specialization, normal form, argument order, or namespace for actual
  consumers or the library's documented purpose.
- An automation rule whose left-hand side matches a public operation that the
  general underlying theorem does not match without unfolding.
- A deliberate additive, multiplicative, dual, or parallel form serving a
  different mathematical contract.
- A worked example, regression test, or explanation whose purpose is to exercise
  an existing result rather than add a competing library implementation.

Check automation and relevant attributes as well as theorem types. Two lemmas
whose proofs both say `simp [definition]` may simplify different public heads or
different argument positions. The general List or algebra API may implement a
definition perfectly well while dedicated interface lemmas remain useful.

A short implementation or one-line proof does not by itself establish useful
reuse either. If a wrapper contributes no mathematical or consumer-facing role,
explain the redundant surface it creates and the replacement consumers should
use. Compatibility-only aliases are not required by cLEAN's initial policy, but
honor an explicit effective project policy that retains them.

Missing in-repository consumers limit evidence about use; they do not establish
that a newly provided public interface has no purpose. Examine its stated role
and use a small external consumer probe when that can resolve the question.
Label probes created for the review separately from pre-existing consumers.

## Examples of the distinction

These examples illustrate judgments, not findings about the target:

- **Actionable duplication:** a local proof reconstructs a located dependency
  result and a demonstrated adapter removes duplicated maintenance. Retain the
  interface if useful; delete it only when its role and migration justify that.
- **Actionable repeated reasoning:** several proofs independently perform the
  same substantial argument, and a proposed shared lemma has identified
  consumers and simplifies their maintenance without distorting the mathematics.
- **Useful interface, keep it:** a theorem normalizes `customOperation []` using
  a general List lemma internally. It lets consumers simplify the public
  operation without unfolding it; the general theorem does not supply that
  operation-specific rewrite by itself.
- **Similar syntax, different contracts:** a product evaluation and a sum of
  logarithms each use list pairing. Merging them needs a useful shared API and
  preservation evidence; visual symmetry does not justify an extraction or an
  identification of the two operations.

## Evidence needed for a finding

Use the canonical [finding record](../references/records.md#finding). For this angle, include:

- The exact duplicate or repeated argument and the located replacement or
  proposed extraction. Give paths, names, and the audited revision.
- The contract comparison and adapter, or the shared statement and its intended
  consumers. Distinguish compiled witnesses from untested proposals.
- The best relevant reason to retain the current interface and why the proposed
  change still has a concrete benefit.
- The known migration boundary, including automation, public attributes, and
  the extent of the consumer search.
- Acceptance evidence: preservation, affected consumers building, and a
  demonstrated maintenance or reuse benefit. Account for materially heavier
  dependencies if the replacement introduces them.

If a matching result, intended use, or preservation argument is still missing,
record the appropriate candidate or unresolved investigation. Recommend a repair
only to the extent supported by evidence. Passing this angle means no actionable
reuse problem was found within the inspected scope, not that every possible
abstraction has been extracted.

## Design sources

- [TauCeti reuse rubric](https://github.com/TauCetiProject/TauCetiReview/blob/main/rubrics/reuse.md):
  search for located replacements and support duplication claims with evidence.
- [TauCeti public API rubric](https://github.com/TauCetiProject/TauCetiReview/blob/main/rubrics/api-design.md):
  characteristic interfaces and the distinction between general mathematics and
  proof-specific helpers.

The evidence protocol, examples, and retention decisions above adapt these ideas
to cLEAN's existing-repository workflow.
