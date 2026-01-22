#!/usr/bin/env bash
set -e

# Install Infisical CLI
mkdir -p .infisical
curl -fsSL https://github.com/Infisical/infisical/releases/latest/download/infisical-linux-amd64.tar.gz \
  | tar -xz -C .infisical
chmod +x .infisical/infisical
export PATH="$PWD/.infisical:$PATH"

# Install uv
python -m pip install --upgrade pip uv

# Sync secrets from Infisical
infisical sync --frozen
