mkdir -p .infisical
curl -fsSL https://github.com/Infisical/infisical/releases/latest/download/infisical-linux-amd64.tar.gz \
    | tar -xz -C .infisical
chmod +x .infisical/infisical
export PATH="$PWD/.infisical:$PATH"
