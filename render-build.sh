#!/bin/bash
set -e
set -o pipefail

echo "==> Installing Python dependencies..."
python -m pip install --upgrade pip
python -m pip install uv
echo "==> Dependencies installed."

echo "==> Installing Infisical CLI..."
mkdir -p .infisical
curl -fsSL https://github.com/Infisical/cli/releases/download/v0.43.48/cli_0.43.48_linux_amd64.tar.gz | tar -xz -C .infisical
chmod +x .infisical/infisical
export PATH="$PWD/.infisical:$PATH"
echo "==> Infisical CLI installed at ./.infisical"
