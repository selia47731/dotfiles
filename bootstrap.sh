#!/bin/bash
# Bootstrap the macOS environment with Nix and nix-darwin.

set -euo pipefail

readonly REPOSITORY_URL="https://github.com/selia47731/dotfiles.git"
readonly DOTFILES_DIR="${HOME}/dotfiles"
readonly FLAKE_HOST="selia"

log() {
  printf '\n==> %s\n' "$*"
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

# This bootstrap script currently targets macOS.
if [[ "$(uname -s)" != "Darwin" ]]; then
  die "This bootstrap script currently supports macOS only."
fi

# Xcode Command Line Tools supplies Git and the macOS SDK.
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools"
  xcode-select --install
  die "Complete the Command Line Tools installation, then rerun this script."
fi

if ! command -v git >/dev/null 2>&1; then
  die "Git is unavailable. Check the Xcode Command Line Tools installation."
fi

# Install Nix in multi-user mode.

if ! command -v nix >/dev/null 2>&1; then
  log "Installing Nix"
  curl \
    --proto '=https' \
    --tlsv1.2 \
    --fail \
    --show-error \
    --location \
    https://nixos.org/nix/install |
    sh -s -- --daemon

  readonly NIX_DAEMON_PROFILE="/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"

  if [[ -r "$NIX_DAEMON_PROFILE" ]]; then
    # shellcheck disable=SC1090
    source "$NIX_DAEMON_PROFILE"
  fi
else
  log "Nix is already installed"
fi

if ! command -v nix >/dev/null 2>&1; then
  die "The nix command is unavailable. Open a new shell and rerun this script."
fi

# Clone the dotfiles repository.
if [[ -d "${DOTFILES_DIR}/.git" ]]; then
  log "Using the existing dotfiles repository"
elif [[ -e "$DOTFILES_DIR" ]]; then
  die "${DOTFILES_DIR} already exists but is not a Git repository."
else
  log "Cloning the dotfiles repository"
  git clone "$REPOSITORY_URL" "$DOTFILES_DIR"
fi

# Apply the nix-darwin configuration.
log "Applying the nix-darwin configuration"

sudo nix \
  --extra-experimental-features "nix-command flakes" \
  run nix-darwin/master#darwin-rebuild -- \
  switch \
  --flake "${DOTFILES_DIR}#${FLAKE_HOST}"

SKK_SETTING_DIR="$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Settings"
SKK_RULES_URL="https://gist.githubusercontent.com/selia47731/dfff4a13939e24c0d51601bcd870f5ec/raw/9212e95753d6099d732ba52cbd6c9eecac1554b4/kana-rule_us.conf"

if [[ ! -d "$SKK_SETTING_DIR" ]]; then
  mkdir -p "$SKK_SETTING_DIR"
fi
curl -fsSL -o "$SKK_SETTING_DIR/$(basename "$SKK_RULES_URL")" "$SKK_RULES_URL"

log "Bootstrap completed"
printf 'Open a new shell to use the activated environment.\n'
