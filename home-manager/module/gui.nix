{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    vivaldi

    hypridle
      hyprlock
      hyprpaper
      hyprpolkitagent
      waybar

    hackgen-font
  ];
}
