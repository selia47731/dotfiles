{ host, pkgs, ... }:

builtins.trace host
{
  home.stateVersion = "25.11";

  home.username = host.username;
  home.homeDirectory = host.homeDirectory;

  home.packages = with pkgs; [
    git
    eza
    bat
    fd
    ripgrep
  ];

  programs.home-manager.enable = true;
}
