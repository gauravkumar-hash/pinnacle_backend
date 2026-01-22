#!/bin/bash
set -e
set -o pipefail

echo "==> Installing Infisical CLI..."

mkdir -p .infisical

# Download latest Infisical CLI release
curl -fsSL https://github.com/Infisical/infisical/releases/latest/download/infisical-linux-amd64.tar.gz \
    | tar -xz -C .infisical

chmod +x .infisical/infisical

# Add to PATH
export PATH="$PWD/.infisical:$PATH"

echo "==> Infisical CLI installed"

echo "==> Installing Python dependencies..."
python -m pip install --upgrade pip
python -m pip install uv

echo "==> Syncing secrets from Infisical..."
infisical sync --frozen

echo "==> Build script completed"
