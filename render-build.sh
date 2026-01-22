#!/usr/bin/env bash
set -e

# Install Infisical CLI
curl -fsSL https://raw.githubusercontent.com/Infisical/infisical/main/install.sh | bash

# Add CLI to PATH
export PATH="$PWD/.infisical:$PATH"

# Install uv
python -m pip install --upgrade pip uv

# Sync secrets
uv sync --frozen
