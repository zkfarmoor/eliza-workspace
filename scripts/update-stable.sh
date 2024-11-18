#! /bin/bash

echo "🔄 Updating eliza-stable..."

# Navigate to stable package and update
cd packages/eliza-stable || exit
git fetch origin --tags 
git checkout v0.0.10

# Install dependencies
PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 pnpm install

# Add necessary build dependencies
pnpm add -D tsup@^8.3.5

# Update core package.json build script
cd core || exit
if ! grep -q "tsup" package.json; then
    sed -i 's/"build": ".*"/"build": "tsup"/' package.json
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

echo "✅ eliza-stable updated and configured"
