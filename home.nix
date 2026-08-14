{ pkgs, ... }:

{
  home = {
    username = "selia";
    homeDirectory = "/home/selia";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "vivaldi";
    };
  };

  programs.home-manager.enable = true;

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  imports = [
    ./dotfiles.nix
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = [
        "vivaldi-stable.desktop"
      ];

      "x-scheme-handler/http" = [
        "vivaldi-stable.desktop"
      ];

      "x-scheme-handler/https" = [
        "vivaldi-stable.desktop"
      ];

      "x-scheme-handler/about" = [
        "vivaldi-stable.desktop"
      ];

      "x-scheme-handler/unknown" = [
        "vivaldi-stable.desktop"
      ];
    };
  };
}
