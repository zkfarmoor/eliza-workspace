# Eliza Workspace Turborepo

This is a monorepo for the Eliza project. It is built with Turborepo and pnpm.

## Packages

- `eliza-core`: The current Eliza monorepo.
- `eliza-stable`: The stable version of Eliza.
- `eliza-custom`: A custom version of Eliza meant for development purposes. (change the name of this to eliza-dev)

## TODO

- [ ] Add a script to build the stable version of Eliza.
- [ ] Add a script to build the custom version of Eliza.
- [ ] Add a script to build the docs for the stable version of Eliza.
- [ ] Add a script to build the docs for the custom version of Eliza.
- [ ] Add a script to start the stable version of Eliza.
- [ ] Add a script to start the custom version of Eliza.
- [ ] Proper clean and build scripts.
- [ ] Ensure we properly handle the imported packages (eliza-core and eliza-stable) for pulling current versions while keeping any necessary dependencies for building our turborepo. (we added type-doc and tsup to the eliza-stable root package, and added a tsup.config.ts file to eliza-stable/core package)