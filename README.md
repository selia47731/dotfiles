# dotfiles for macOS(Apple Silicon)

This repository contains my dotfiles tailored for macOS(Apple Silicon).

## Prerequisites
Make sure you have installed the following tools:
```bash
sudo xcode-select --install
```
Check that `xcode-select -p` returns `/Library/Developer/CommandLineTools`.

## Supported Environment
This setup is strictly for macOS (Apple Silicon, arm64) and will **not work on Intel Macs or other platforms**.

## Installation
Run the bootstrap script;
```bash
/bin/bash -c "$(curl -fsSL https://https://raw.githubusercontent.com/selia47731/dotfiles/refs/heads/main/bootstrap.sh)"
```
The script will:
- Check OS & architecture (will exit if not on macOS Apple Silicon)
- Install Homebrew (if not already installed)
- Install required Homebrew packages
- Set up symlinks using `stow` (`zsh`, `nvim`, `tmux`, `wezterm`, `emacs`)
- Install Lua 5.1.5 and configure luarocks
- Install Deno using [dvm](https://github.com/justjavac/dvm)
- Set up `macSKK` for Japanese input(Kana rules included)

# Notes
- If `bootstrap.sh` is not executable, run:
```bash
chmod +x bootstrap.sh
```
- Homebrew will only be installed if it is not already present.
- `macSKK` custom Kana rules will be appended to `kana-rule.conf`, not overwritten.
