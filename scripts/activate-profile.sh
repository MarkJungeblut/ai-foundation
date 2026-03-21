#!/bin/bash

set -euo pipefail

# `pwd` prints the absolute path after changing into the script directory.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
profiles_dir="$repo_root/profiles"
active_agents_dir="$repo_root/.codex/agents"
active_profile_file="$repo_root/.codex/ACTIVE_PROFILE"

list_profiles() {
  find "$profiles_dir" -mindepth 1 -maxdepth 1 -type d ! -name '_baseline' -exec basename {} \; | sort
}

usage() {
  cat <<'EOF'
Usage:
  ./scripts/activate-profile.sh <profile-name>
  ./scripts/activate-profile.sh --list

Examples:
  ./scripts/activate-profile.sh dotnet-service
  ./scripts/activate-profile.sh --list
EOF
}

if [[ "${1:-}" == "--list" ]]; then
  list_profiles
  exit 0
fi

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

profile_name="$1"
baseline_file="$profiles_dir/_baseline/profile.sh"
profile_file="$profiles_dir/$profile_name/profile.sh"

if [[ ! -f "$baseline_file" ]]; then
  echo "Missing baseline profile definition: $baseline_file" >&2
  exit 1
fi

if [[ ! -f "$profile_file" ]]; then
  echo "Unknown profile: $profile_name" >&2
  echo >&2
  echo "Available profiles:" >&2
  list_profiles >&2
  exit 1
fi

BASELINE_AGENT_SOURCES=()
PROFILE_AGENT_SOURCES=()
PROFILE_DEVCONTAINER=""

source "$baseline_file"
source "$profile_file"

mkdir -p "$active_agents_dir"
find "$active_agents_dir" -maxdepth 1 -type f -name '*.toml' -delete

for source_file in "${BASELINE_AGENT_SOURCES[@]}" "${PROFILE_AGENT_SOURCES[@]}"; do
  cp "$repo_root/$source_file" "$active_agents_dir/"
done

mkdir -p "$(dirname "$active_profile_file")"
printf '%s\n' "$profile_name" > "$active_profile_file"

echo "Activated profile: $profile_name"
echo "Devcontainer: ${PROFILE_DEVCONTAINER:-<not set>}"
echo "Active agents:"
find "$active_agents_dir" -maxdepth 1 -type f -name '*.toml' -exec basename {} \; | sort
