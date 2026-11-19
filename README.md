# Dotfiles

Personal configuration files for macOS and NixOS, managed declaratively with Nix Flakes.

## Features

- **Nix Flakes** – Reproducible system configurations
- **nix-darwin** – macOS system configuration
- **NixOS** – Linux system configurations (ARM64 and x86_64)
- **Home Manager** – User environment and dotfiles management
- **nix-homebrew** – Declarative Homebrew management on macOS

## Managed Configurations

| Platform | Configuration | Architecture          |
| -------- | ------------- | --------------------- |
| macOS    | nix-darwin    | Apple Silicon (ARM64) |
| NixOS    | ARM64         | aarch64-linux         |
| NixOS    | x86-64        | x86_64-linux          |

## Installation

Clone the repository:

```bash
git clone git@github.com:selia47731/dotfiles.git
cd dotfiles
```

### macOS

Run the bootstrap script:

```bash
./bootstrap.sh
```

Apply the configuration:

```bash
sudo darwin-rebuild switch --flake .#selia
```

### NixOS

Apply the appropriate configuration for your machine:

```bash
sudo nixos-rebuild switch --flake .#<configuration>
```

Replace `<configuration>` with the corresponding hostname defined in `flake.nix`.

## Updating

Pull the latest changes:

```bash
git status
git pull --ff-only
```

Review local modifications before pulling if the working tree is dirty.

Apply the updated configuration:

**macOS:**

```bash
sudo darwin-rebuild switch --flake .#selia
```

**NixOS:**

```bash
sudo nixos-rebuild switch --flake .#<configuration>
```

## Repository Layout

```text
dotfiles/
├── bootstrap.sh
├── emacs/
├── flake.lock
├── flake.nix
├── home-manager/
│   ├── home.nix
│   └── module/
│       ├── dev.nix
│       ├── dotfiles.nix
│       ├── git.nix
│       ├── gui.nix
│       ├── media.nix
│       └── shell.nix
├── hypr/
├── kitty/
├── niri/
├── nix-darwin/
│   ├── default.nix
│   └── module/
│       ├── configuration.nix
│       ├── home-manager.nix
│       ├── homebrew.nix
│       └── nixpkgs.nix
├── nixos/
│   ├── arm64/
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── x86-64/
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── nvim/
├── omniwm/
├── waybar/
├── wezterm/
└── zsh/
    ├── zeno/
    └── zsh/
        └── fsh-themes/
```

## Notes

- If `bootstrap.sh` is not executable, run:

  ```bash
  chmod +x bootstrap.sh
  ```

- Nix Flakes use `flake.lock` to pin input revisions for reproducible configurations.
