#!/bin/bash

echo "🔧 Configuring packages for turborepo..."

# Function to add tsup config to a package
add_tsup_config() {
    local package_dir=$1
    if [ ! -f "$package_dir/tsup.config.ts" ]; then
        cat > "$package_dir/tsup.config.ts" << 'EOF'
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
}

# Configure core packages
for pkg in packages/eliza-core/packages/*; do
    if [ -d "$pkg" ]; then
        echo "Configuring $pkg..."
        add_tsup_config "$pkg"
        
        # Update package.json build script
        if [ -f "$pkg/package.json" ]; then
            sed -i 's/"build": ".*"/"build": "tsup"/' "$pkg/package.json"
        fi
    fi
done

# Configure stable packages
if [ -d "packages/eliza-stable/core" ]; then
    echo "Configuring eliza-stable/core..."
    add_tsup_config "packages/eliza-stable/core"
fi

echo "✅ Package configuration complete" 