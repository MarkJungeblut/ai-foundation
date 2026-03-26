# Task Summary

## Goal

Improve the repository's day-to-day Codex workflow by making the README easier to use, establishing committed task summaries, and adding an explicit skill for creating those summaries at the end of non-trivial work.

## Changes Made

- Simplified the top-level README into a faster entry point with setup guidance and concise best practices
- Added committed task-summary conventions and a reusable template under `docs/task-summaries/`
- Added the explicit-only repo skill `create-summary` to generate new handoff notes for completed tasks

## Files Touched

- `README.md`
- `AGENTS.md`
- `.agents/skills/create-summary/SKILL.md`
- `.agents/skills/create-summary/agents/openai.yaml`
- `docs/task-summaries/_template.md`
- `docs/task-summaries/2026-03-26-task-summary-convention.md`
- `docs/task-summaries/2026-03-26-create-summary-skill.md`

## Decisions

- Keep task summaries as committed repository docs instead of private `.codex` notes
- Use a repo-local skill with `agents/openai.yaml` so `$create-summary` stays explicit-only and well-defined

## Follow-Ups

- Use `$create-summary` as the standard way to capture end-of-task handoff notes
- Restart or rescan Codex if the repo skill does not appear immediately
