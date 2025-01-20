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
git clone https://github.com/yuu-komesu/dotfiles.git
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
