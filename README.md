# dotfiles

This repository contains my dotfiles(only for apple M series macOS).

## Prerequisites
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
brew tap homebrew/bundle
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/ie42-yk/dotfiles.git
```

2. Install brew packages:
```bash
cd dotfiles
brew bundle --file Brewfile
```

3. Use stow to create symbolic links:
```bash
stow -v zsh
stow -v nvim
stow -v tmux
```

4. Install deno(dvm):
```bash
brew install dvm
dvm install install 2.1.6
```

5. Install lua-5.1.5:
```bash
wget http://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -xvf lua-5.1.5.tar.gz
cd lua-5.1.5
-- change Makefile `INSTALL_TOP= /usr/local` to `INSTALL_TOP= /usr/local/lua-5.1`
make macosx
sudo make install
```
and setting luarocks:
`sudo nvim /opt/homebrew/etc/luarocks/config-5.1.lua`
```lua
-- config-5.1.lua
rocks_trees = {
   {
      bin = "/usr/local/lua-5.1/bin",
      lib = "/usr/local/lua-5.1/lib",
      name = "user",
      root = "/usr/local/lua-5.1",
      share = "/usr/local/lua-5.1/share"
   }
}
variables = {
   LUA = "/usr/local/lua-5.1/bin/lua",
   LUA_BINDIR = "/usr/local/lua-5.1/bin",
   LUA_DIR = "/usr/local/lua-5.1",
   LUA_INCDIR = "/usr/local/lua-5.1/include",
   LUA_LIBDIR = "/usr/local/lua-5.1/lib"
}
```
`nvim ~/.luarocks/config-5.1.lua`
```lua
lua_version = "5.1"
rocks_trees = {
    {
        bin = "/usr/local/lua-5.1/bin",
        lib = "/usr/local/lua-5.1/lib",
        name = "user",
        root = "/usr/local/lua-5.1",
        share = "/usr/local/lua-5.1/share"
    }
}
variables = {
    LUA = "/usr/local/lua-5.1/bin/lua",
    LUA_BINDIR = "/usr/local/lua-5.1/bin",
    LUA_DIR = "/usr/local/lua-5.1",
    LUA_INCDIR = "/usr/local/lua-5.1/include",
    LUA_LIBDIR = "/usr/local/lua-5.1/lib"
}
```
