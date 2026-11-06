#!/usr/bin/env bash
# Verify the core tools expected in the cloud development container.
set -Eeuo pipefail

check_command() {
  local command_name="$1"
  if command -v "$command_name" >/dev/null 2>&1; then
    printf 'OK   %-12s %s\n' "$command_name" "$("$command_name" --version 2>&1 | head -n 1)"
  else
    printf 'MISS %-12s not installed\n' "$command_name"
    return 1
  fi
}

status=0
check_command git || status=1
check_command node || status=1
check_command npm || status=1
check_command pnpm || status=1
check_command python3 || status=1
check_command psql || status=1

if [[ "$status" -ne 0 ]]; then
  echo "One or more required tools are unavailable." >&2
  exit 1
fi

echo "All required workspace tools are available."
