---
name: clean
description: Audit and refactor existing Lean 4 mathematical repositories for reuse, maintainability, faithful statements, and coherent APIs and module boundaries. Use for formalization cleanup, repository reorganization, or evidence-backed quality assessment; not for unrelated filesystem cleaning or proving a new mathematical project from scratch.
metadata:
  version: "4"
---

# cLEAN

Turn an existing Lean formalization into mathematics that people and agents can
understand, maintain, and build on. Preserve the claimed results while improving
the library around them. Work against actual definitions, consumers, pinned
dependencies, and mathematical sources.

## Choose the work

Identify the target repository separately from this instruction folder. Resolve
links below relative to this skill. Follow the user's scope and existing project
instructions; this skill supplies a workflow, not authority to expand the task.

| Request | Workflow |
| --- | --- |
| Assess or review quality | [Audit](workflows/audit.md); leave target sources unchanged |
| Design a cleanup or reorganization | [Planning](workflows/planning.md), using current audit evidence |
| Apply a refactor or clean up the repository | Audit and plan as needed, then [Repair](workflows/repair.md) and [Verify](workflows/verify.md) |
| Check an existing patch | [Verify](workflows/verify.md), refreshing only affected baseline and review evidence |
| Run with multiple agents | Add [Coordinate](workflows/coordinate.md) when delegation is available and authorized |

An end-to-end cleanup request authorizes the necessary local audit, planning,
repair, and checks within its scope. Continue between those stages without
asking for approval of routine implementation choices. An audit or plan alone
does not authorize source edits. Publishing, upstream submissions, and service
integrations require their own authorization; this skill needs none of them.

For a small, clearly named repair, keep the baseline and plan inline and read
only the relevant rubric and repair/verification sections. Broad inventories,
separate design reports, and a campaign ledger are for work that needs them.
The same preservation and acceptance requirements still apply.

For user-facing handoffs, use [Report](workflows/report.md) to choose a useful
explanation and any supporting visuals. Every run reports numerical coverage,
verified changes, and available before/after measurements from the
[run records](references/records.md). Capture baseline inputs before editing;
a small job can keep its records and summary inline.

## Choose persistence

Use **bounded mode** by default: finish the requested scope using the workflows
above. Select **campaign mode** when the user asks for it, or clearly requests
repeated discovery and cleanup across a declared scope until a closure review
finds no further actionable work. A whole-repository path alone does not select
campaign mode. Record `mode: bounded` or `mode: campaign` in the run state.

For campaign mode, read [Campaign](workflows/campaign.md). It wraps the same
audit, planning, repair, and verification work in a coverage-and-discovery loop;
finishing the initial backlog is not its completion condition. Preserve the
requested operation: a campaign audit or plan still leaves target sources
unchanged. Mode selection does not grant delegation, publication, extra resource
spending, or a broader mathematical scope. Explicit requests take precedence
over defaults, and a resumed run retains its recorded mode until changed.

## Review quality

Read [Shared review rules](rubrics/_common.md) whenever judging quality. Use the
following angles where relevant. Broad library audits and cleanups require
[individual theorem coverage](workflows/audit.md#theorem-coverage) for removable
hypotheses and existing Mathlib/local replacements throughout the declared scope,
in bounded as well as campaign mode. Other angles can use representative deep
inspection when the coverage is labeled. A user-requested sample retains its
explicit limits; resource limits leave coverage incomplete rather than silently
converting a full review into sampling. Focused repairs and patch verification
review the changed and affected declarations without expanding to the repository.

| Angle | Decision |
| --- | --- |
| [Correctness](rubrics/correctness.md) | Do statements and definitions express the intended mathematics? |
| [Build health](rubrics/build-health.md) | Are Lean/Mathlib versions suitable for reuse, and do the scoped builds run without warnings? |
| [Scope](rubrics/scope.md) | Does this change advance the requested cleanup while preserving claims? |
| [Reuse](rubrics/reuse.md) | Can located mathematics replace duplicated implementation without losing a useful interface? |
| [API design](rubrics/api-design.md) | Can consumers use the objects through a coherent public interface? |
| [Generality](rubrics/generality.md) | Are assumptions and abstractions at a useful, natural level? |
| [Architecture](rubrics/architecture.md) | Do mathematical homes and imports separate foundations from proof machinery? |
| [Naming](rubrics/naming.md) | Can a user find the right declaration and predict its meaning? |
| [Documentation](rubrics/documentation.md) | Can a reader identify the contents, contracts, and intended uses? |
| [Attribution](rubrics/attribution.md) | Are mathematical and formal sources credited and traceable? |
| [Proof quality](rubrics/proof-quality.md) | Do proofs expose useful reasoning and remain understandable and robust? |

## Operating contract

**Preserve mathematics and trust.** Keep the main claims and intended meanings of
definitions. A generalized replacement must still derive the original claim.
Preservation does not require freezing every original signature; record any
stricter compatibility requirement rather than introducing one by default.
Introduce no proof holes or additional trusted assumptions, and do not disguise
an existing incomplete library as verified. A successful build alone does not
establish semantic preservation. Keep an independent baseline specification for
changed definitions and important statements; see verification.

**Refactor substantially when useful.** Reorganize modules, rename declarations,
replace duplication, extract reusable facts, improve APIs, generalize justified
statements, and rewrite proofs. Document breaking changes and migrate affected
in-repository uses. Compatibility aliases are optional under cLEAN's default;
honor any stricter effective project policy. Keep Lean and dependency revisions
fixed unless upgrading is part of the request.

**Separate correction from cleanup.** A suspected wrong or vacuous theorem needs
an explicit mathematical correction work item. Do not silently weaken a claim,
assume the missing result, or redefine its objects to make a refactor pass.
Continue independent work while an unresolved specification blocks one part.

**Plan across dependencies; change bounded units.** Establish the relevant
mathematical organization before widespread edits. Try a representative unit
with a consumer, verify it, and use what it teaches to execute the remaining
scope. Avoid imposing a new folder taxonomy or a numerical quality score.

**Make evidence durable and proportionate.** Use the user's working location or
an identified run directory. The [record formats](references/records.md) define
theorem coverage, findings, tasks, checks, verified improvements, and measurements.
Small jobs can keep them in one file; large campaigns should keep resumable shared
records. Reuse evidence only when its inputs still match. Observe resource limits
and report actual coverage.

**Finish honestly.** Deliver reviewable changes, verification results, migration
notes, and remaining findings. Separate audit completion, task acceptance, and
repository verification. Missing tools or exhausted resources limit the claim;
they do not prove success or failure of the mathematics.

For the rationale and source-to-design mapping, read [Design](docs/design.md).
For installation and example requests, see [README](README.md).
