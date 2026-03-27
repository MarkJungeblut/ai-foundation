# React Fullstack Profile

`react-fullstack` is a Next.js-based fullstack profile for modern React and TypeScript work.

It combines the shared baseline with a narrow frontend and fullstack active set and uses the React fullstack devcontainer as its environment.

Activate it with:

```bash
./scripts/activate-profile.sh react-fullstack
```

## Environment

Use [`.devcontainer/react-fullstack/devcontainer.json`](../../.devcontainer/react-fullstack/devcontainer.json) for this profile.

That devcontainer keeps the shared Codex setup, uses Node.js 22, and adds common React fullstack editor extensions such as ESLint, Prettier, and Tailwind CSS support.

## Baseline Agents

This profile always includes the shared baseline documented in [profiles/_baseline/README.md](../_baseline/README.md).

## React-Fullstack Agents

This profile adds the following default-first implementation agent:

- `nextjs-developer`

`nextjs-developer` is the primary implementation specialist for this profile. It keeps delegation simple for normal React fullstack work involving Next.js application structure, routing, server actions or route handlers, and TypeScript application behavior.

## Optional Supporting Agents

These agents are useful for narrower situations, but they are not part of the default active set in `.codex/agents/`:

- `typescript-pro`: use when TypeScript typing, compiler behavior, or type-system design is the primary concern
- `frontend-developer`: use when the task is more general frontend implementation work than Next.js-specific fullstack behavior
- `api-designer`: use when contract design or API evolution is the main concern
- `ui-designer`: use when UX, layout, or visual design direction needs dedicated attention
- `performance-engineer`: use when runtime performance, rendering behavior, bundle size, or Core Web Vitals need direct focus
- `tooling-engineer`: use when linting, formatting, CI, or workflow tooling needs direct ownership

These optional agents are not vendored by default. If the repo starts depending on one as an active default, copy its reviewed TOML into a profile-owned `agents/` folder and update the profile definition in git.

## Expected Validation And Quality Gates

For `react-fullstack`, the active agents should expect and respect these quality gates where the project supports them:

- code formatting
- linting and static analysis
- build validation
- automated tests
- performance-sensitive checks where they materially affect user experience
- security review for meaningful auth, data handling, or server-side changes

The exact command set depends on the concrete Next.js application, but the quality bar does not.

## Skill Status

There is no dedicated `react-fullstack` skill in v1.

If repeated procedural guidance starts showing up across multiple React or Next.js repos, add a `react-fullstack` skill later for shared workflow knowledge such as linting, testing, routing conventions, data fetching patterns, and deployment expectations.

The required `nextjs-developer` agent for this profile is vendored under `profiles/react-fullstack/agents/` so activation stays self-contained.
