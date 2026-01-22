#!/bin/bash
set -e
set -o pipefail

echo "==> Installing Infisical CLI..."
mkdir -p .infisical
cd .infisical
curl -fsSL https://github.com/Infisical/cli/releases/download/v0.43.48/cli_0.43.48_linux_amd64.tar.gz -o infisical-cli.tar.gz
tar -xzvf infisical-cli.tar.gz
chmod +x infisical
cd ..
export PATH="$PWD/.infisical:$PATH"

echo "==> Installing Python dependencies..."
python -m pip install --upgrade pip
python -m pip install uv

echo "==> Loading secrets from Infisical..."
# Use fetch to generate .env
infisical fetch --format=env > .env

echo "==> Build script completed successfully."
