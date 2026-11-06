# Troubleshooting

## Preview URL does not open

1. Confirm the development server is still running.
2. Confirm it binds to `0.0.0.0`, not only `localhost`.
3. Open the Codespaces Ports panel and verify the expected port is forwarded.
4. Keep the port Private unless public access is required.

## pnpm is missing

Run:

```bash
npm install --global pnpm@10
pnpm --version
```

Then reopen the terminal.

## Dependencies fail to install

- Check the project Node.js engine requirement.
- Delete `node_modules` only if necessary, then run `pnpm install`.
- Inspect the first actual error in the terminal rather than relying only on the final summary.

## Codespace is slow

- Stop unused services and terminals.
- Avoid running multiple builds simultaneously.
- Use a larger Codespaces machine only when necessary; larger machines consume compute faster.
- Stop the Codespace when finished.

## Database connection fails

- Verify the database host is reachable from the Codespace.
- Confirm the connection string is stored as a secret and loaded by the application.
- Check provider IP allowlists and TLS requirements.
