# dotfiles for macOS(Apple Silicon)

This repository contains my dotfiles tailored for macOS(Apple Silicon).

## Features

- nix-darwin
- Home Manager
- nix-homebrew
- Falakes

## Installation
```bash
git clone git@github.com:selia47731/dotfiles.git
cd dotfiles
./bootstrap.sh
```
## Updating
```bash
git pull
sudo darwin-rebuild switch --flake .#selia
```

## Repository layout
```
dotfiles/
├── bootstrap.sh
├── emacs/
├── flake.lock
├── flake.nix
├── home-manager/
│   └── selia/
│       ├── home.nix
│       └── module/
├── nix-darwin/
│   ├── default.nix
│   └── module/
├── nvim/
├── README.md
├── wezterm/
└── zsh/
    ├── zeno/
    └── zsh/
        └── fsh-themes/
```


# Notes
- If `bootstrap.sh` is not executable, run:
```bash
chmod +x bootstrap.sh
```
- Homebrew will only be installed if it is not already present.
- `macSKK` custom Kana rules will be appended to `kana-rule.conf`, not overwritten.
