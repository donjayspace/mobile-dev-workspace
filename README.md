# Mobile Dev Workspace

A reusable GitHub Codespaces environment for developing Next.js, NestJS, Express, Python, and other web applications from an Android phone or desktop browser.

## What is included

- Node.js 24 development container feature.
- Python 3.12 development container feature.
- pnpm 10 package manager setup.
- Git and common command-line utilities.
- PostgreSQL client tools (not a database server).
- VS Code extensions for TypeScript, ESLint, Prettier, Tailwind CSS, Prisma, Python, and Git.
- Port forwarding defaults for web applications and APIs.
- Next.js project scaffolding script.
- Android-specific usage and troubleshooting documentation.

## Quick start

1. Create a GitHub repository and upload this workspace.
2. Open the repository on GitHub.
3. Select **Code → Codespaces → Create codespace on main**.
4. Wait for container creation and `scripts/setup.sh` to finish.
5. Run the health check:

   ```bash
   bash scripts/health-check.sh
   ```

6. Create a Next.js application:

   ```bash
   bash scripts/create-nextjs-app.sh my-next-app
   cd my-next-app
   pnpm dev --hostname 0.0.0.0
   ```

7. Open the forwarded port `3000` from the Codespaces Ports panel.

## Important architecture note

This repository is a reusable development environment, not a production hosting platform. Codespaces is for development and preview. Deploy production applications separately using the hosting platform selected for each project.

The PostgreSQL client is installed, but no PostgreSQL server is bundled. Use a managed PostgreSQL instance or a separately provisioned development database.

## Security

- Keep forwarded ports Private by default.
- Never commit real `.env` files, API keys, tokens, private keys, or database credentials.
- Use GitHub Codespaces secrets for credentials needed by the cloud environment.
- Review dependency and framework versions before production deployment.

## Customizing forwarded ports

Edit `forwardPorts` and `portsAttributes` in `.devcontainer/devcontainer.json` when your project uses additional ports.
