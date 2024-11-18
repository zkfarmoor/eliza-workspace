# Eliza Workspace Turborepo

This is a monorepo for the Eliza project. It is built with Turborepo and pnpm.

## Packages

- `eliza-core`: The current Eliza monorepo.
- `eliza-stable`: The stable version of Eliza.
- `eliza-custom`: A custom version of Eliza meant for development purposes. (change the name of this to eliza-dev)
- `examples`: A collection of example SDK implementations to integrate with Eliza.

## TODO

- [ ] Proper clean, build, and install scripts.
- [ ] Ensure we properly handle the imported packages (eliza-core and eliza-stable) for pulling current versions while keeping any necessary dependencies for building our turborepo. (we added type-doc and tsup to the eliza-stable root package, and added a tsup.config.ts file to eliza-stable/core package)
- [ ] Proper playwright install script after building.
- [ ] Exclude the `src/dev/examples` folder from the build process.
- [ ] Clean up/fix the `docs/src/dev/lifi/` docs.
- [ ] Update our `cursorrules` file.
- [ ] Resolve the pnpm.overrides warning and other packages/eliza-core warnings.
- [ ] Configure turborepo remote caching.
