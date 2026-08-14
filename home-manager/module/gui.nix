{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ liv.optionals pkgs.stdenv.isLinux [
    vivaldi

    hypridle
      hyprlock
      hyprpaper
      hyprpolkitagent
      waybar
  ];
}
