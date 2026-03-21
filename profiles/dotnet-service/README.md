# Dotnet Service Profile

`dotnet-service` is a backend and service-delivery profile for modern C# and .NET work.

It combines the shared baseline with a narrow `.NET`-specific active set and uses the C# devcontainer as its environment.

Activate it with:

```bash
./scripts/activate-profile.sh dotnet-service
```

## Environment

Use [`.devcontainer/csharp/devcontainer.json`](../../.devcontainer/csharp/devcontainer.json) for this profile.

That devcontainer keeps the shared Codex setup and adds the latest LTS `.NET` SDK for C# development.

## Baseline Agents

This profile always includes the shared baseline documented in [profiles/_baseline/README.md](../_baseline/README.md).

## Dotnet-Service Agents

This profile adds the following default-first implementation agent:

- `dotnet-core-expert`

`dotnet-core-expert` is the primary implementation specialist for this profile. It keeps delegation simple for normal `.NET` service work involving APIs, hosting, middleware, and application behavior.

## Optional Supporting Agents

These agents are useful for narrower situations, but they are not part of the default active set in `.codex/agents/`:

- `csharp-developer`: use when the task is more general C# application work than ASP.NET or service architecture work
- `backend-developer`: use when you want a more stack-agnostic backend implementation perspective
- `api-designer`: use when contract design, compatibility, or API evolution is the primary concern

These optional agents remain available from the upstream catalog in `awesome-codex-subagents/` and can be pulled into `.codex/agents/` later if the repo needs them as active defaults.

## Expected Validation And Quality Gates

For `dotnet-service`, the active agents should expect and respect these quality gates where the project supports them:

- code formatting
- linting and static analysis
- build validation
- automated tests
- SonarQube or equivalent code-quality feedback
- security review for meaningful code or configuration changes

The exact command set depends on the concrete `.NET` service, but the quality bar does not.

## Skill Status

There is no dedicated `.NET` skill in v1.

If repeated procedural guidance starts showing up across multiple `.NET` service repos, add a `dotnet-service` skill later for shared workflow knowledge such as build, test, publish, migrations, configuration, and service conventions.
