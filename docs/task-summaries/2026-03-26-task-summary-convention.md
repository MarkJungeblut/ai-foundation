# Task Summary

## Goal

Add a lightweight, committed convention for end-of-task Codex thread summaries so new tasks can start in fresh threads without losing context.

## Changes Made

- Added `docs/task-summaries/` with a short reusable template
- Updated repo-wide agent rules to require summaries for non-trivial tasks
- Added a short README note pointing contributors to the summary location and naming convention

## Files Touched

- `AGENTS.md`
- `README.md`
- `docs/task-summaries/_template.md`

## Decisions

- Store task summaries as committed repo docs instead of private `.codex` notes
- Keep summaries short and structured rather than saving full thread transcripts

## Follow-Ups

- Start creating one summary file per non-trivial task using the shared template
