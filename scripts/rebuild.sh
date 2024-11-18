#! /bin/bash

# Purge
rm -rf node_modules
rm -rf packages/*/node_modules
rm -rf packages/*/core/node_modules
rm -rf packages/*/core/dist
rm -rf docs/node_modules
rm -rf packages/*/packages/*/node_modules
rm -rf packages/*/docs/node_modules
rm -rf pnpm-lock.yaml

# Rebuild
pnpm install
pnpm build

# Install playwright
pnpm playwright:install