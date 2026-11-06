#!/usr/bin/env bash
# Configure package tooling after the Codespace container is created.
set -Eeuo pipefail

log() {
  printf '\n[workspace-setup] %s\n' "$1"
}

# Ensure the selected Node.js runtime is available before configuring pnpm.
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is missing. Check the Node devcontainer feature." >&2
  exit 1
fi

log "Node.js: $(node --version)"
log "npm: $(npm --version)"

# Install pnpm globally so projects can use a consistent package manager
# without depending on Corepack being bundled with a particular Node release.
if ! command -v pnpm >/dev/null 2>&1; then
  npm install --global pnpm@10
fi

log "pnpm: $(pnpm --version)"

# Print Python versions when the Python devcontainer feature is enabled.
if command -v python3 >/dev/null 2>&1; then
  log "Python: $(python3 --version)"
fi

# Install dependencies only when this workspace itself contains a package.json.
# Project repositories opened in this environment can install their own packages.
if [[ -f package.json ]]; then
  log "Installing repository dependencies"
  pnpm install
else
  log "No root package.json found; skipping dependency installation"
fi

log "Workspace setup complete"
