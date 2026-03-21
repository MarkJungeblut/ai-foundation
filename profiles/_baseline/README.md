# Shared Baseline Profile

This repository uses profiles as a repo convention, not as a native Codex runtime feature.

Every serious delivery profile starts with the same cross-cutting baseline. These baseline agents cover product decisions, security, code quality, testing confidence, and tooling quality gates.

## Baseline Agents

- `product-manager`: keeps work aligned to user and product intent, and helps avoid overbuilding
- `security-auditor`: reviews code and configuration for concrete security weaknesses
- `code-reviewer`: the default code-audit and maintainability review role for this repo
- `qa-expert`: plans validation depth, test coverage, and release confidence
- `tooling-engineer`: owns developer workflow quality, including formatting, linting, static analysis, and CI-facing checks

## Quality Gate Expectations

Every profile built on this baseline should expect the following checks to exist and be respected where available:

- formatting must pass
- linting or static analysis must pass
- tests must pass
- security findings must be addressed according to repo policy
- SonarQube or equivalent quality-gate feedback must be reviewed where configured

The exact commands can vary by technology, but the baseline expectation is stable across profiles.
