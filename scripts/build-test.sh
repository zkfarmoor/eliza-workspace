#!/bin/bash

# Full build script
echo "🏗️ Building workspace..."

# Run clean install first
bash ./scripts/clean.sh
bash ./scripts/install.sh

# Build all packages
echo "Building packages..."
pnpm build

echo "✅ Build complete!"