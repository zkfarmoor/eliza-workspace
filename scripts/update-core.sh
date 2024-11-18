#! /bin/bash

echo "🔄 Updating eliza-core..."

# Update the submodule
git submodule update --remote packages/eliza-core

# Navigate to core package
cd packages/eliza-core || exit

# Install dependencies
PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm install

# Add necessary build dependencies
pnpm add -D tsup@^8.3.5

# Update package.json build script
if ! grep -q "tsup" package.json; then
    sed -i 's/"build": ".*"/"build": "turbo run build --filter=\\"packages\/**\\""/' package.json
fi

# Add tsup config if it doesn't exist
if [ ! -f "tsup.config.ts" ]; then
    cat > tsup.config.ts << 'EOF'
import { defineConfig } from "tsup";

export default defineConfig({
    entry: ["src/index.ts"],
    outDir: "dist",
    sourcemap: true,
    clean: true,
    format: ["esm"],
    external: [
        "fs",
        "path",
        "http",
        "https",
        "@reflink/reflink",
        "@node-llama-cpp",
        "agentkeepalive"
    ],
});
EOF
fi

echo "✅ eliza-core updated and configured"
