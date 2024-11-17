#!/bin/bash

sudo pnpm --filter "@workspace/eliza-core" setup-playwright
sudo pnpm --filter "@workspace/eliza-stable" setup-playwright