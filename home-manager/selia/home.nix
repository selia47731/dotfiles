{ user, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = user;
  home.homeDirectory = "/Users/${user}";

  home.packages = with pkgs; [
    git
    eza
    bat
    fd
    ripgrep
  ];

  programs.home-manager.enable = true;
}
