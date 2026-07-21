{ user, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = user;
  home.homeDirectory = "/Users/${user}";

  programs.home-manager.enable = true;

  imports = [
    ./module/dev.nix
    ./module/dotfiles.nix
    ./module/git.nix
    ./module/gui.nix
    ./module/media.nix
    ./module/shell.nix
  ];
}
