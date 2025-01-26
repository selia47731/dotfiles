# dotfiles for macOS(Apple M series)

This repository contains my dotfiles tailored for macOS(Apple M series chip).

## Prerequisites
Make sure you have installed the following tools:
- [Homebrew](https://brew.sh/)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git

# Installation
1. Clone this repository;
```bash
git clone https://github.com/ie42-yk/dotfiles.git
cd dotfiles
```

2. Run the bootstrap script;
```bash
./bootstrap.sh
```
The script will:
- Install Homebrew packages
- Set up symlinks using `stow`
- Install Lua 5.1.5 and configure luarocks
- Install Deno using [dvm](https://github.com/justjavac/dvm)

# Note
- This setup is optimized for macOS(Apple M series chip) and not work as expected on other platforms.
- Ensure `bootstrap.sh` is executable by running `chmod +x bootstrap.sh` before running it.
