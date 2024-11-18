#!/bin/bash

echo "🎭 Installing Playwright..."

# Install Playwright dependencies in core package
cd packages/eliza-core
npx playwright install-deps
npx playwright install

# Install Playwright dependencies in stable package
cd ../eliza-stable
npx playwright install-deps
npx playwright install

echo "✅ Playwright installation complete!"