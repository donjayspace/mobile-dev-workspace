# Development guide

## Start a project

Open the project directory in the Codespaces terminal and install dependencies:

```bash
pnpm install
```

Start the relevant application:

```bash
pnpm dev --hostname 0.0.0.0
```

For Next.js, the default port is `3000`. For APIs, use a port configured in the application and add it to `.devcontainer/devcontainer.json` when needed.

## Git workflow

```bash
git status
git add .
git commit -m "Describe the change"
git push
```

Commit only source files and safe configuration. Never commit `.env`, `.env.local`, private keys, access tokens, database dumps, or production secrets.

## Environment variables

- Use `.env.example` for documented variable names and safe placeholders.
- Store actual values in untracked `.env.local` files or GitHub Codespaces secrets.
- Validate required variables at application startup.
- Rotate any credential that is accidentally committed.

## Database connectivity

A PostgreSQL client is included. A database server is not installed by default. Use a managed PostgreSQL provider or a separately configured database service, and provide its connection string through a secret.

## Prisma

Run Prisma commands from the project that owns the Prisma schema:

```bash
pnpm exec prisma generate
pnpm exec prisma migrate dev
```

Do not run production migrations from a mobile development Codespace unless the deployment process explicitly requires it and the target environment is confirmed.
