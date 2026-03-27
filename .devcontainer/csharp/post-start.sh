#!/bin/bash

set -euo pipefail

# `pwd` prints the absolute path after changing into the script directory.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/../.." && pwd)"
target_profile="dotnet-service"

/bin/bash "$repo_root/.devcontainer/scripts/post-start.sh"

active_profile_file="$repo_root/.codex/ACTIVE_PROFILE"

if [[ ! -f "$active_profile_file" ]]; then
  /bin/bash "$repo_root/scripts/activate-profile.sh" "$target_profile"
  exit 0
fi

current_profile="$(tr -d '[:space:]' < "$active_profile_file")"

if [[ "$current_profile" == "$target_profile" ]]; then
  /bin/bash "$repo_root/scripts/activate-profile.sh" "$target_profile"
  exit 0
fi

echo "Skipping automatic profile activation; active profile is '$current_profile'."
