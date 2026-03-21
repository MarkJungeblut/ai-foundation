# Dotnet Service Profile

`dotnet-service` is a backend and service-delivery profile for modern C# and .NET work.

It combines the shared baseline with `.NET`-specific implementation agents and uses the C# devcontainer as its environment.

## Environment

Use [`.devcontainer/csharp/devcontainer.json`](../../.devcontainer/csharp/devcontainer.json) for this profile.

That devcontainer keeps the shared Codex setup and adds the latest LTS `.NET` SDK for C# development.

## Baseline Agents

This profile always includes the shared baseline documented in [profiles/_baseline/README.md](../_baseline/README.md).

## Dotnet-Service Agents

This profile adds the following implementation-focused agents:

- `csharp-developer`
- `dotnet-core-expert`
- `backend-developer`
- `api-designer`

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
