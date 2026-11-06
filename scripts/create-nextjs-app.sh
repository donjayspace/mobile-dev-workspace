#!/usr/bin/env bash
# Scaffold a new Next.js App Router project using the workspace's pnpm tooling.
set -Eeuo pipefail

PROJECT_NAME="${1:-}"

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: bash scripts/create-nextjs-app.sh <project-name>" >&2
  exit 2
fi

# Restrict the directory name to safe package/project characters.
if [[ ! "$PROJECT_NAME" =~ ^[a-zA-Z0-9][a-zA-Z0-9._-]*$ ]]; then
  echo "Invalid project name. Use letters, numbers, dots, underscores, or hyphens." >&2
  exit 2
fi

if [[ -e "$PROJECT_NAME" ]]; then
  echo "A file or directory named '$PROJECT_NAME' already exists." >&2
  exit 1
fi

pnpm create next-app@latest "$PROJECT_NAME" \
  --typescript \
  --tailwind \
  --eslint \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --use-pnpm

printf '\nProject created at: %s\n' "$PROJECT_NAME"
printf 'Next: cd %q && pnpm dev\n' "$PROJECT_NAME"
