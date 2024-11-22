#!/bin/bash

sudo env "PATH=$PATH" pnpm --filter "@workspace/eliza-core" playwright:install
sudo env "PATH=$PATH" pnpm --filter "@workspace/eliza-stable" playwright:install
sudo env "PATH=$PATH" pnpm --filter "@workspace/eliza-core/packages/plugin-node" playwright:install