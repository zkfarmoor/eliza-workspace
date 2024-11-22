#! /bin/bash

echo "🔄 Updating eliza-core..."

# Update the submodule
git submodule update --remote --reference https://github.com/ai16z/eliza.git --branch stable-11-17 packages/eliza-core

# Navigate to core package
cd packages/eliza-core || exit

# Install dependencies
PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm install

# Update root package.json scripts
if [ -f "package.json" ]; then
    # Update build and setup-playwright scripts
    sed -i 's/"build": ".*"/"build": "PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm install \&\& bash .\/scripts\/build.sh"/' package.json
    sed -i 's/"setup-playwright": ".*"/"setup-playwright": "cd packages\/plugin-node \&\& npx playwright install-deps \&\& npx playwright install"/' package.json
fi

# Update packages/core/package.json
if [ -f "packages/core/package.json" ]; then
    sed -i 's/"build": ".*"/"build": "tsup --format esm --dts"/' "packages/core/package.json"
fi

# Update packages/plugin-node/package.json
if [ -f "packages/plugin-node/package.json" ]; then
    sed -i 's/"playwright:install": ".*"/"playwright:install": "npx playwright install-deps \&\& npx playwright install"/' "packages/plugin-node/package.json"
fi

# Add necessary dependencies
pnpm add -D typedoc@^0.26.11 tsup@^8.3.5

echo "✅ eliza-core updated and configured"
