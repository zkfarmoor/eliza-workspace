#!/bin/bash

sudo pnpm --filter "@workspace/eliza-core" playwright:install
sudo pnpm --filter "@workspace/eliza-stable" playwright:install
sudo pnpm --filter "@workspace/eliza-core/packages/plugin-node" playwright:install
