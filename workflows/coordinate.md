# Coordinate agents and integration

Use this workflow only when multiple agents are available and delegation is
authorized by the user or host instructions. Otherwise perform the same work
sequentially. A file describing a role does not launch an agent, and cLEAN does
not require a platform, API account, or continuously running service.

The coordinator owns the shared plan, interface decisions, task assignment,
integration candidate, and final report. Workers own bounded tasks. Reviewers
assess the candidate against the original contract and applicable rubrics.
Separate roles when useful; avoid agents whose only purpose is to repeat the
same review without adding coverage or evidence.

## Establish shared state

Use [run and task records](../references/records.md). Record the current base,
specification snapshot, module/interface plan, effective policies, dependencies,
ownership, and verification commands. Keep one authoritative task state. Workers
report results to its owner rather than independently rewriting shared status.
A Markdown ledger is enough when it is kept current.

Distinguish three graphs:

- **File imports:** what Lean modules depend on for elaboration/builds.
- **Mathematical/declaration dependencies:** what a result or definition uses,
  established by inspection or appropriate tooling, not inferred solely from
  imports.
- **Refactor task dependencies:** what edits or decisions must precede others.

A planning tree is not a theorem dependency graph. Use these views to choose
work; do not require a complete declaration graph before useful bounded work.

## Dispatch useful units

Claim a task before editing. Send the worker:

- Its task ID, base snapshot, read/write boundary, and isolated location.
- The desired mathematical and consumer outcome and relevant findings.
- Agreed definitions, signatures, namespaces, import direction, and migration
  requirements; identify any interface it must not change unilaterally.
- Applicable skill workflows and rubrics, baseline limitations, preservation
  reference, check commands/targets, resource allocation, and return contract.

Give enough raw context to investigate; do not supply a desired review verdict.
Workers can challenge a finding with evidence. Review tasks need the original
contract and sources in addition to the implementation author's explanation.

Parallelize when interfaces are stable and changes integrate independently.
Disjoint filenames are insufficient: two tasks can still alter the same class
instance, notation, generated name, namespace, or shared import boundary. Make
shared definition changes an explicit prerequisite, assign them one owner,
then dispatch consumer migrations against the settled interface.

Prefer separate worktrees/checkouts for concurrent edits. A Git worktree usually
has its own `.lake`, so coordinate cache/storage strategy without unsafe
symlinking or concurrent writes to one build directory. If only a shared tree
is available, partition file ownership and serialize shared-file edits and
builds that could race. Do not let one worker clean another's build output.

## Control compilation and cost

Share the user-provided total resource budget among workers, reviews, and
integration; parallelism does not create additional authorization or resources.
Limit expensive build concurrency according to observed CPU, memory, and I/O.
Deduplicate identical checks at the same snapshot, not checks of different
patches that happen to touch similarly named files.

Order enabling work from earlier mathematical modules toward dependents, but
adapt when a high-impact shared edit would invalidate many active workers.
Avoid a global rename while consumer migrations are still in flight. Use the
first integrated unit to measure whether the partition and build schedule work.

## Review, integrate, and resume

1. Receive the worker's [handoff](../references/records.md#handoff-and-completion):
   patch/base, modified interfaces, migration map, check inputs and results,
   observed improvement, and remaining issues.
2. Review against task acceptance and the preserved specification. For important
   definition changes, use a reviewer who did not author the replacement when
   possible. Independence improves judgment; it does not replace Lean checks.
3. Integrate in prerequisite order. Resolve conflicts by inspecting both
   mathematical intentions and affected consumers. Do not accept a textual merge
   as evidence of a compatible API.
4. Validate the merged snapshot with [Verify](verify.md). Worker results stay
   attributed to their original snapshots. Mark `integrated` only after the
   required combined checks pass; invalidate evidence whose inputs changed.
5. Update the shared state, rebase remaining work deliberately, and dispatch the
   next ready tasks.

In [campaign mode](campaign.md), the coordinator also owns coverage and the
discovery frontier. When the initial tasks finish, inspect the next uncovered
area or perform closure review; do not end the campaign on worker completion
counts. Dispatch a fresh closure reviewer only when delegation is authorized.

For a stopped or lost worker, inspect its patch and logs before reassignment;
record the old claim as released so two workers do not resume the same task.
For context loss, resume from the ledger and current diff, not from remembered
"done" messages. Failed proposals and their reasons can be recorded briefly
when they prevent repeated exploration.

Stop an unproductive approach when evidence defeats its benefit, a prerequisite
cannot be resolved, or its allocation is exhausted. Replan dependent work and
continue independent tasks. Escalate a specification, compatibility, or resource
choice only when existing authorization cannot resolve it. Routine integration
is the coordinator's job.

At completion, report accepted/integrated work separately from deferred,
blocked, or unchecked work, and identify the exact final candidate. Do not count
worker messages, green subtasks, or number of agents as evidence that the
repository's claims and quality goals have been met.
