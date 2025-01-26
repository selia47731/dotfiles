#!/bin/bash
# This script is for macOS arm64

set -euo pipefail

# First ckeck OS and architecture
if [[ "$(uname -sm)" != "Darwin arm64" ]]; then
  echo "Unsupported OS or architecture"
  exit 1
fi


# Install homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed"
fi
brew install git
brew tap homebrew/bundle


# Clone the dotfiles repository
git clone https://github.com/ie42-yk/dotfiles.git
cd dotfiles || exit 1

# Install stow
brew install stow

# Use the stow command to create symlinks
if [[ ! -d zsh || ! -d nvim || ! -d tmux ]]; then
  echo "Required directories (zsh, nvim, tmux) are missing in the dotfiles repository"
  exit 1
fi
stow -v zsh
stow -v nvim
stow -v tmux

source ~/.zshrc

# Install brew packages
brew bundle --file Brewfile


# Install lua-5.1.5
LUA_URL="http://www.lua.org/ftp/lua-5.1.5.tar.gz"
WORK_DIR="tmp/lua_build"
INSTALL_DIR="/usr/local/lua-5.1"

if [[ ! -d "$INSTALL_DIR" ]]; then
  mkdir -p "$WORK_DIR"
  cd "$WORK_DIR" || exit 1

  curl -R -O "$LUA_URL"
  tar zxf lua-5.1.5.tar.gz
  cd lua-5.1.5 || exit 1

  sed -i.bak "s|^INSTALL_TOP= /usr/local|INSTALL_TOP= ${INSTALL_DIR}|" Makefile

  make macosx
  make install
else
  echo "lua-5.1.5 is already installed at $INSTALL_DIR"
fi

# setting up luarocks for lua-5.1.5
cat <<EOF > ~/.luarocks/config-5.1.lua
lua_version = "5.1"
rocks_trees = {
   {
      bin = "${INSTALL_DIR}/bin",
      lib = "${INSTALL_DIR}/lib",
      name = "user",
      root = "${INSTALL_DIR}",
      share = "${INSTALL_DIR}/share"
   }
}
variables = {
   LUA = "/usr/local/lua-5.1/bin/lua",
   LUA_BINDIR = "/usr/local/lua-5.1/bin",
   LUA_DIR = "/usr/local/lua-5.1",
   LUA_INCDIR = "/usr/local/lua-5.1/include",
   LUA_LIBDIR = "/usr/local/lua-5.1/lib"
}
EOF

luarocks config lua_version 5.1
luarocks install luautf8
luarocks install luaposix
luarocks install luarocks-build-rust-mlua


# Install dvm(deno version manager)
curl -fsSL https://dvm.deno.dev | sh
