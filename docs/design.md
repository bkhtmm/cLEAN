# Design and research record

Research sources reviewed on 6 November 2026; theorem coverage and reporting
design updated on 8 November 2026. This document explains cLEAN's choices; runtime
agents normally need only the entry point and the relevant workflows/rubrics.
The instructions synthesize the sources below rather than vendoring their
prompts. cLEAN is not endorsed by these projects.

## The problem boundary

A successful formalization is not automatically a useful library. cLEAN starts
with existing code and claims, discovers their actual structure, and develops a
cleanup plan from evidence. The user need not already have a curated roadmap.
The output is a checked patch and usable mathematical interfaces when repair is
requested; an audit is a valid separate result when that is the request.

The existing draft's preservation, evidence, compatibility, audit, planning, and
reuse principles remain the foundation. Version 0.2 completes the missing
workflows and review dimensions. This is a procedural skill: it does not claim
to implement an orchestrator, theorem search engine, import analyzer, or proof
comparator. Agents use the tools available in the target environment.

## TauCeti: granular review criteria

Read all ten angles, the shared protocol, the rubric README, and its naming
reference at commit
[`69d02fabe9493b5c4fbd871a1f342894774ef9a8`](https://github.com/TauCetiProject/TauCetiReview/tree/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics).
The reviewed repository declares Apache-2.0. The table links directly to the
reviewed angle that informed each cLEAN area.

| Source angle | cLEAN interpretation |
| --- | --- |
| [Correctness](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/correctness.md) | Investigate intended meaning, vacuity, and assumptions independently of build success |
| [Reuse](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/reuse.md) | Locate actual replacements; compare contracts and retain useful interface roles |
| [Scope](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/scope.md) | Use the cleanup mandate, current claims, and consumers instead of requiring a roadmap |
| [API design](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/api-design.md) | Exercise characteristic interfaces, exported mathematics, extensionality, and automation |
| [Generality](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/generality.md) | Require natural assumptions and concrete uses for abstraction |
| [Placement](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/placement.md) | Extend declaration placement into a whole-repository architecture assessment |
| [Naming](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/naming.md) | Use located terminology and consumer discoverability, with target namespace conventions |
| [Documentation](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/documentation.md) | Check accurate mathematical contracts and durable library navigation |
| [Attribution](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/attribution.md) | Preserve informal and formal provenance across extraction and moves |
| [Proof quality](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/proof-quality.md) | Judge demonstrated clarity and fragility, without universal tactic bans |

TauCeti's [shared protocol](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/_common.md)
is designed for PR review after CI. cLEAN instead establishes the target's
baseline, keeps confidence separate from check status, and retains project
compatibility requirements. The [naming reference](https://github.com/TauCetiProject/TauCetiReview/blob/69d02fabe9493b5c4fbd871a1f342894774ef9a8/rubrics/references/naming-conventions.md)
was read as convention context; cLEAN directs agents to actual pinned precedents
rather than copying that manual into each run.

## Build and dependency health

[Kim Morrison's Stacks review](https://kim-em.github.io/blog/2026-11-5-axioms-formalization-of-the-stacks-project/)
motivates explicit checks for Lean/Mathlib freshness and warning-free builds.
TauCeti's review angles run after CI; cLEAN must assess those conditions in the
existing repository rather than inherit that assumption. The
[build-health rubric](../rubrics/build-health.md) uses the shared finding and
confidence rules, dated upstream evidence, and scoped diagnostic logs. It keeps
upgrade recommendations separate from changing pins and distinguishes documented
warning exceptions from an unqualified clean-build claim.

## Resolution: architecture and review burden

Read the [Resolution article](https://resolution.org/post/formalizing-resolution-of-singularities)
and inspected Figures 2–4 interactively. Figure 2 is a task-plan history, not a
Lean theorem dependency graph. Figure 3 separates object/foundation mathematics
from resolution machinery, applications, examples, and removed material. Figure
4 distinguishes files containing statement definitions from their import closure
and the rest of the library. The account also identifies recompilation as a
practical constraint and describes trusted statement comparison.

cLEAN's response is to map mathematical roles before bulk edits, justify homes
by contracts and dependencies, assess statement vocabulary separately from proof
imports, and test a representative migration before expanding. `Defs.lean` is a
useful option, not a mandatory file in every folder. The article motivates these
choices; it does not demonstrate that cLEAN can automate the same judgment.

## Prove2Me: durable work and progressive disclosure

Read [the public skill](https://prove2.me/skill.md), version `0.13.9`, and
[onboarding entry](https://prove2.me/start.md). The skill routes roles to detailed
references and describes a contribution loop with verified outcomes. Its fetched
skill SHA-256 was
`0347059987973c147798c1a22545b9302ffe2953825fbfc923499250a50bf723`.

[Anthropic's FLT account](https://www.anthropic.com/research/formalizing-fermats-last-theorem)
describes benefits from a theorem DAG, separately managed statements/proofs, and
searchable descriptions. cLEAN borrows the design motivation: resumable task
state, explicit dependencies and contracts, and small context-specific guides.
It does not upload repositories, require platform authentication, freeze every
local declaration, or reproduce the platform's statement/proof file protocol.

## Preservation tools and limits

Checked [Comparator's documentation](https://github.com/leanprover/comparator/blob/865edc14486c3388e9225daa971da8e157488c3e/README.md)
at commit `865edc14486c3388e9225daa971da8e157488c3e`. It reports migration to
Lean/Lake starting with v4.35.0 and describes trusted challenge/configuration
requirements and limits of open definitions. cLEAN therefore selects checks for
the pinned environment and requires preserved definition meanings; it does not
make the archived standalone checker a universal installation prerequisite.

## Design choices to test

Three acceptance questions remain separate: does the candidate build under the
permitted assumptions, does it preserve the intended claims, and does it deliver
the promised quality improvement? No aggregate score substitutes for them.

Use one canonical finding/task/check format, with optional shared state for
teams. Small tasks need little ceremony; large campaigns need resumable records,
interface ownership, integration evidence, and compilation scheduling. Candidate
findings become investigations until evidence supports a repair. No finding is
required when the existing design is good.

Small Lean-only pilots informed this draft. They do not establish broad Mathlib
search accuracy, large-project build cost, or multi-agent integration reliability.
Real pilots should include those areas before claiming public production readiness.

## Campaign persistence

Version 0.3 adds an optional campaign policy selected in ordinary request text
and retained in the run record. The selection is separate from the authorized
operation: audit and planning campaigns still do not edit the target. Bounded
tasks remain the default.

The missing behavior in the earlier draft was discovery after the initial plan
finished. Campaign mode tracks area/angle coverage, revisits changed boundaries
for new reuse opportunities, and requires a separate closure review. An empty
initial backlog and a successful pilot are insufficient for repository-wide
completion. Each repair still needs preservation and a concrete benefit, and
accepted designs are reopened only with new evidence.

Campaign completion is relative to declared scope and recorded inspection depth.
Limits, missing checks, and material unresolved findings produce incomplete
checkpoints. The skill describes how to resume; automatic continuation belongs
to the host runtime. No platform-specific persistent goal, scheduler, or service
is required or activated by selecting this mode.

## Explaining results

The [reporting guide](../workflows/report.md) adds presentation decisions to the
existing handoff contract. It uses the run/check records as evidence and chooses
explanations to fit the transformation and the user's needs. It introduces no
fixed dashboard, chart quota, or renderer dependency. Numerical summaries use the
counting and evidence rules below without imposing a visual report format.

Resolution's before-and-after organization and statement-footprint views motivate
explaining the change itself. The FLT account's history and milestone views
motivate optional explanations of a campaign's progression. These are design
influences, not mandatory report formats or claims that cLEAN already extracts
the same data automatically. Useful comparisons need preserved baseline inputs.

The initial guide is ready for real-run trials. Those trials should assess
whether users can understand the benefit, find the mathematics and evidence,
and distinguish verified outcomes from proposals, partial coverage, and pending
checks. Add repeatable rendering helpers only when actual use justifies them.

## Individual coverage and measured changes

The [TauCeti quality-indicators article](https://taucetiproject.org/blog/2026-10-28-simple-quality-indicators-for-lean-libraries/),
read on 8 November 2026, asks individual-theorem questions about entirely removable
hypotheses and Mathlib duplicates or one-line consequences. These are partial,
model-judged indicators, not a complete definition of library quality. They
motivate guaranteed declaration coverage for two focused checks alongside cLEAN's
broader semantic and architectural review.

The substantive generality/reuse rubrics already describe those checks. The new
mechanism is an initial census, two separately evidenced outcomes per theorem,
stable migration identities, and a final reconciliation. Broad audits and cleanups
require that coverage independently of bounded/campaign mode; focused repairs
retain their limited scope. Other review angles can retain declared sampling.
New helpers and context changes reopen relevant work. The Markdown contract does
not supply a census executable or guarantee the quality of a model's judgment.

Reports derive verified change totals from accepted, integrated final edits and
their checks: individual hypotheses wholly removed, distinct theorems improved,
and independent implementations replaced through Mathlib or local reuse. Useful
wrappers need not disappear. Before/after source size and migration counts explain
scale and organization, without becoming quality goals. Findings, verified fixes,
and optional external judge rates remain distinct; added/removed declarations and
judge variability must not be hidden by a single percentage. Whether exhaustive
coverage improves independent evaluation scores remains a hypothesis for real runs.
