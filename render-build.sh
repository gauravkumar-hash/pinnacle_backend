#!/bin/bash
# render-build.sh
# This script installs Infisical CLI, syncs secrets, and prepares your app for Render

set -e  # Exit immediately if a command fails
set -o pipefail  # Fail if any part of a pipe fails

echo "==> Installing Infisical CLI..."

# Create directory for Infisical CLI
mkdir -p .infisical
cd .infisical

# Download the working Infisical CLI release
curl -fsSL https://github.com/Infisical/cli/releases/download/v0.43.48/cli_0.43.48_linux_amd64.tar.gz -o infisical-cli.tar.gz

# Extract
tar -xzvf infisical-cli.tar.gz

# Make CLI executable
chmod +x infisical

# Return to project root and add CLI to PATH
cd ..
export PATH="$PWD/.infisical:$PATH"

echo "==> Infisical CLI installed at ./.infisical"

# Upgrade pip and install uv (Python CLI tool)
echo "==> Installing Python dependencies..."
python -m pip install --upgrade pip
python -m pip install uv

# Sync secrets from Infisical
echo "==> Syncing secrets from Infisical..."
infisical sync --frozen

echo "==> Build script completed successfully."
