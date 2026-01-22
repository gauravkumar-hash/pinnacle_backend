#!/bin/bash
set -e
set -o pipefail

echo "==> Activating virtual environment..."
source .venv/bin/activate

echo "==> Upgrading pip..."
python -m pip install --upgrade pip

echo "==> Installing Python dependencies..."
# Make sure you install uvicorn, fastapi, etc.
python -m pip install -r requirements.txt
python -m pip install uvicorn

echo "==> Dependencies installed."

echo "==> Installing Infisical CLI..."
mkdir -p .infisical
curl -fsSL https://github.com/Infisical/cli/releases/download/v0.43.48/cli_0.43.48_linux_amd64.tar.gz | tar -xz -C .infisical
chmod +x .infisical/infisical
export PATH="$PWD/.infisical:$PATH"
echo "==> Infisical CLI installed at ./.infisical"

echo "==> Build complete ✅"
