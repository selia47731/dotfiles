{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # CLI
    eza
    fzf
    git
    lazygit
    neovim
    tree-sitter

    # Desktop applications
    vivaldi
    wezterm

    # Hyprland ecosystem
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent

    # Desktop components
    waybar
    xdg-desktop-portal-hyprland
  ];

  fonts.packages = with pkgs; [
    hackgen-nf-font
  ];
}
