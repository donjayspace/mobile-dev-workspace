# Next.js App Router template

Use this guide when creating a new Next.js project inside the Codespace.

## Create a project

From the workspace root:

```bash
bash scripts/create-nextjs-app.sh donexisflow
cd donexisflow
pnpm dev
```

The development server normally listens on port `3000`. Codespaces forwards that port and provides a browser-accessible preview URL.

## Suggested additions for full-stack projects

Add these only when the project requires them:

```bash
pnpm add @prisma/client
pnpm add -D prisma
pnpm add zod
```

Initialize Prisma after choosing the database provider:

```bash
pnpm exec prisma init
```

Keep secrets in `.env.local` or Codespaces repository/environment secrets. Never commit real credentials.

## Preview requirements

For Next.js running in Codespaces, use:

```bash
pnpm dev --hostname 0.0.0.0
```

Binding to `0.0.0.0` makes the development server reachable through Codespaces port forwarding.
