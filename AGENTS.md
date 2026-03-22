# Repository Working Rules

These rules apply as the default working contract for all agents and profiles in this repository.

## Verification

1. Before finishing a code change, run the smallest relevant verification available.
2. Prefer project-native commands over invented ones.
3. If linting, formatting, or Sonar-style checks exist, use them.
4. If a check cannot run, report that explicitly.

## Planning

- Make a short plan before implementing when the change is non-trivial, spans multiple areas, or has unclear risks or tradeoffs.

## Implementation

- State important assumptions explicitly when they affect the solution.
- Prefer the smallest safe change that solves the task.
- Follow existing project patterns unless there is a clear reason not to.
- For non-trivial work, define success criteria before implementation.

## Notes

- Treat these rules as the repo-wide default unless a task-specific spec requires something stricter.
- Verification should match the scope of the change. Small changes still need validation, but not every task requires the largest possible test sweep.
- If verification is partial, state what was checked and what remains unverified.
