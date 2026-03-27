# Task Summary

## Goal

Add a repo-local `check-last-summary` Codex skill that reloads the latest committed task summary so future sessions can resume with the last persisted handoff context.

## Changes Made

- Added the explicit-only repo skill `.agents/skills/check-last-summary/`
- Documented the skill workflow for selecting the latest committed summary, with a filename-based fallback when git history is unavailable
- Updated the top-level README to mention `$check-last-summary` alongside the existing task-summary workflow

## Files Touched

- `.agents/skills/check-last-summary/SKILL.md`
- `.agents/skills/check-last-summary/agents/openai.yaml`
- `README.md`

## Decisions

- Implemented `check-last-summary` as a repo-local skill so it stays aligned with this repository's committed summary convention
- Kept the skill explicit-only and instruction-based for v1, without extra scripts
- Defined "last summary" as the most recently committed summary in `docs/task-summaries/`, with a fallback to the newest dated summary filename when git history is unavailable

## Follow-Ups

- Restart or rescan Codex if the new skill does not appear immediately
