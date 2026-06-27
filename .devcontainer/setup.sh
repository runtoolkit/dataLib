#!/bin/bash
set -e

# ── Package manager detection ─────────────────────────────────────────
for PM in apt-get apt yum dnf apk; do
  if command -v "$PM" &>/dev/null; then PKG="$PM"; break; fi
done
if [ -z "$PKG" ]; then
  echo "❌ No package manager found!" >&2
  exit 1
fi
echo "📦 Package manager: $PKG"

# ── sudo detection ────────────────────────────────────────────────────
SUDO=""
command -v sudo &>/dev/null && SUDO="sudo"

# ── System packages ───────────────────────────────────────────────────
echo "📦 Installing system packages..."
if [ "$PKG" = "apk" ]; then
  $SUDO apk update && $SUDO apk add --no-cache \
    git curl wget unzip zip build-base \
    python3 py3-pip ca-certificates gnupg coreutils bash \
    jq git-lfs python3-venv diffutils patch file shellcheck
else
  $SUDO $PKG update -y && $SUDO $PKG install -y \
    git curl wget unzip zip build-essential \
    python3 python3-pip python3-venv ca-certificates gnupg lsb-release \
    jq git-lfs diffutils patch file shellcheck
fi

# ── Git LFS init ──────────────────────────────────────────────────────
echo "🗂  Initializing Git LFS..."
git lfs install

# ── Node.js 20 ────────────────────────────────────────────────────────
echo "📦 Installing Node.js 20..."
if command -v node &>/dev/null; then
  echo "  Already installed: $(node -v)"
else
  wget -q -O /tmp/node.tar.gz \
    "https://nodejs.org/dist/v20.20.2/node-v20.20.2-linux-x64.tar.gz"
  $SUDO tar -xzf /tmp/node.tar.gz -C /usr/local --strip-components=1
  rm /tmp/node.tar.gz
fi

# ── Java 21 (Temurin binary) ──────────────────────────────────────────
echo "☕ Installing Java JDK 21..."
if command -v java &>/dev/null; then
  echo "  Already installed: $(java -version 2>&1 | head -1)"
else
  wget -q -O /tmp/jdk21.tar.gz \
    "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.7%2B6/OpenJDK21U-jdk_x64_linux_hotspot_21.0.7_6.tar.gz"
  $SUDO mkdir -p /opt/jdk21
  $SUDO tar -xzf /tmp/jdk21.tar.gz -C /opt/jdk21 --strip-components=1
  rm /tmp/jdk21.tar.gz
  export JAVA_HOME=/opt/jdk21
  export PATH="$JAVA_HOME/bin:$PATH"
  printf 'export JAVA_HOME=/opt/jdk21\nexport PATH=$JAVA_HOME/bin:$PATH\n' \
    | $SUDO tee /etc/profile.d/jdk21.sh > /dev/null
fi

# ── SDKMAN ────────────────────────────────────────────────────────────
echo "🧰 Installing SDKMAN..."
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"
if [ ! -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
  curl -s "https://get.sdkman.io" | bash
fi
# shellcheck disable=SC1091
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# ── Gradle 8.8 ────────────────────────────────────────────────────────
echo "🐘 Installing Gradle 8.8..."
if command -v gradle &>/dev/null && gradle -v 2>/dev/null | grep -q "8.8"; then
  echo "  Already installed: $(gradle -v | head -2 | tail -1)"
else
  sdk install gradle 8.8
fi

# ── Done ──────────────────────────────────────────────────────────────
echo ""
echo "✅ Versions:"
node -v
npm -v
java -version
gradle -v
jq --version
shellcheck --version | head -1
git lfs version
