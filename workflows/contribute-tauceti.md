# Contribute reusable mathematics to Tau Ceti

Use this optional workflow when the user requests Tau Ceti contribution work
arising from an existing formalization. Follow the requested stage: assess
candidates, prepare local contributions, or submit and shepherd code PRs.
Ordinary cleanup does not select this workflow. Preparation alone does not
authorize publication; an existing submission mandate covers the necessary
code PRs, updates, and responses within its scope without repeated permission
requests. Roadmap drafts are prepared locally for human review and submission.

## Plan the foundations around the goal

Start with the user's mathematical goal and the source project's definitions,
results, and reusable preliminaries. Reuse current cLEAN findings and checks
where their inputs still match. Plan the foundations needed across the selected
scope, then implement coherent units in dependency order. Include supporting
lemmas and usable APIs rather than pursuing only the headline theorem.

Read the current [Tau Ceti README](https://github.com/TauCetiProject/TauCeti),
[agent instructions](https://github.com/TauCetiProject/TauCeti/blob/main/AGENTS.md),
relevant [roadmaps](https://github.com/TauCetiProject/TauCetiRoadmap), and
[scope rubric](https://github.com/TauCetiProject/TauCetiReview/blob/main/rubrics/scope.md).
Record the revisions consulted. These govern destination contributions; cLEAN's
local cleanup mandate does not replace Tau Ceti's contribution rules.

Search Mathlib and Tau Ceti for existing definitions, results, and compatible
APIs. Check open PRs, recent merges, and claimed work. Read roadmap specifications
themselves; status summaries can lag. Map the selected preliminaries to existing
material, concrete missing targets or prerequisites, and uncovered mathematics.
Keep the search proportional to the requested contribution scope.

## Establish where each piece belongs

Choose a route from the mathematical content, not its source filename:

- **Already available:** use the canonical result. Do not submit another proof
  or private definition merely to export the source project's spelling.
- **Improvement to existing Tau Ceti code:** refactoring, correction,
  documentation, and modest generalization within its existing mathematical
  scope need no new roadmap entry.
- **New mathematics:** identify an exact roadmap file and target. Show how the
  contribution advances it or supplies a real, proximate prerequisite. The
  lemma need not be listed verbatim; speculative usefulness is insufficient.
- **No existing roadmap fit:** record the gap and prepare a local roadmap
  proposal for the human. Continue independent covered work. Do not open a
  roadmap PR or issue, or submit uncovered implementation as though a proposed
  roadmap had already been accepted.

A result extracted during source-project cleanup may still be new mathematics
for Tau Ceti. A broad area name or PR attribution line does not establish fit.
Explain why each selected contribution is needed and check that another PR has
not already supplied it. Respect active claims and follow the current
coordination process without opening roadmap-repository PRs or issues yourself;
record any human action needed.

## Prepare a coherent library contribution

Use a separate Tau Ceti checkout with its pinned dependencies. Keep the source
project's preservation baseline and dependency pins intact unless changing them
is part of the request. Adapt the result to the destination's canonical objects,
names, imports, and interfaces. New supporting work must remain within the
selected contribution scope and its roadmap justification.

Retain mathematical references, original formalization authors, source revision,
and declaration locations. Follow the roadmap repository's
[porting guidance](https://github.com/TauCetiProject/TauCetiRoadmap#porting-existing-work):
coordinate with the authors and obtain their agreement; if coordination is
impossible, verify the licence permits reuse and prepare the required Zulip
discussion for authorized human handling.

Use [Repair](repair.md) and [Verify](verify.md) for the relevant transformation,
preservation, and consumer checks. Review the selected and affected declarations;
a contribution does not require auditing unrelated source-project mathematics.
Supply enough API to make introduced objects usable. Follow Tau Ceti's current
build, axiom, linter, and compatibility policies. Check a representative use,
including recovery of the source result when its formulation changed. Record
unavailable checks rather than describing the patch as verified.

## Prepare uncovered roadmaps for the human

Follow the current [roadmap contribution guide](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/CONTRIBUTING.md)
and read nearby merged examples. Prefer a coherent revision to an existing
roadmap when it fits its boundaries. Specify the intended mathematics
independently of the existing code, with clear scope, conventions, useful APIs,
and milestones grounded in existing libraries or explicit prerequisite targets.
Cite the source formalization as prior work rather than treating its layout or
statements as the specification.

Prepare the required roadmap files and, where useful, suggested Lean interfaces
against the destination dependencies. Distinguish admitted interface prototypes
from proved implementation; roadmap prototypes do not authorize proof holes in
library code. Record AI assistance and identify mathematical or design decisions
that need human review.

Deliver the local draft with a short tutorial: what the human should check, how
to submit it for roadmap review, and which code contributions can follow once
the accepted specification covers them. Human approval and submission remain
separate from implementation review. A roadmap and its existing implementation
can support one effort through the two repositories and their distinct processes.

## Shepherd authorized code PRs

For preparation-only work, deliver the checked local patch and proposed PR text.
For an authorized submission run, open a PR for one coherent topic. Include the
source attribution, exact roadmap target or existing-code justification, checks,
and the required standalone `Roadmap: CanonicalAreaName` or `Roadmap: none` line
under the current attribution rules.

Do not open stacked PRs, including drafts. Land prerequisites first, refresh
against current main, and submit the next standalone diff. Independent work can
proceed while a PR waits. Use [Coordinate](coordinate.md) when delegation is
available and authorized; parallel execution does not waive contribution rules.

Address CI failures and review findings, update the patch, and obtain current
review evidence after material changes. Use the current
[TauCetiReview instructions](https://github.com/TauCetiProject/TauCetiReview)
and rubrics; do not assume a comment or push automatically starts review. Answer
findings with fixes or evidence, and identify conflicting review requirements
explicitly. Follow the project's bounded repair and closure rules when roadmap
fit remains contested. Let the project's review and merge process land the PR.

When included in the user's mandate, contribute a commensurate amount of review
on other contributors' PRs using TauCetiReview. Keep that optional work within
the resource budget and record it separately from review of your own patches.

As contributions merge, refresh the dependency plan and continue with the next
ready unit. A submission run is not finished merely because its first PR opened.
Respect the selected scope and runtime limits; this file does not start a
background service or grant an unlimited contribution campaign.

## Keep STATUS current and finish at the requested stage

Maintain a concise `STATUS` file in the run directory. Use the existing
[run, task, and check records](../references/records.md) as its evidence; STATUS
can itself hold those records for a small run. Update it after material events:

- The goal, contribution scope, source and destination revisions, and roadmaps.
- Selected preliminaries, their target or route, and prerequisite order.
- PRs opened and landed, current heads, CI and review status, and next actions.
- Roadmap drafts awaiting human review and any other unresolved dependencies.
- A central estimate for finishing the agreed scope, with assumptions and
  uncertainty about external review or merging. If a calendar estimate cannot
  be supported, give the remaining local effort estimate and explain the limit.

For assessment, finish with evidenced candidate decisions. For preparation,
finish with reviewable local patches or roadmap drafts and their check status.
For submission, distinguish prepared, submitted, reviewed, and merged work.
When an external dependency or resource limit prevents further progress, leave
a resumable checkpoint with the exact next action; keep pending PRs visible.

Once the roadmap-covered part of the agreed goal has landed, return to the user
with the remaining gaps and a tutorial on contributing the needed new or revised
roadmaps. Where scope permits, demonstrate use of the shared result from the
source project or another concrete consumer. State separately what was cleaned
locally, accepted into Tau Ceti, and actually reused downstream.
