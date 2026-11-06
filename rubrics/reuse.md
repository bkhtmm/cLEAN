# Reuse and duplication

Use with the [Shared review rules](_common.md). Assess whether the scoped
library builds effectively on existing mathematics and exposes genuinely shared
reasoning. The goal is a useful mathematical interface with less duplicated
maintenance, not the smallest possible collection of declarations.

## Choose the unit and search the available library

Inspect the declaration, its mathematical contract, its proof or construction,
and its known consumers. Use the target's pinned dependencies. Distinguish a
replacement available there from an upstream result that would require a
separate dependency upgrade.

Look for:

- Existing results with matching or appropriately more general statements.
  Search mathematical names, hypotheses, conclusions, relevant namespaces, and
  nearby variants rather than relying on identifier similarity alone.
- Existing lemmas that replace substantial repeated steps inside a proof.
- Repeated constructions that could use a located library combinator or API.
- Substantial repeated reasoning across consumers that could share a lemma or
  construction with a natural mathematical contract.

Start with the relevant topic and expand the search when evidence points beyond
it. Search Mathlib at the project's pinned revision, alongside local declarations
and other dependencies, for existing results and constructions that cover the
implementation being reviewed. Record meaningful search boundaries and inspect
promising hits. Do not require every review to search the internet or assume a
failed text search establishes absence.

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

- **Actionable duplication:** a local theorem re-proves a located dependency
  theorem with the same contract, adds no useful interface or automation role,
  and its consumers can use the existing theorem through a demonstrated adapter.
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
