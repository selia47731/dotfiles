{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    vivaldi

    hyprlock
    hyprpolkitagent
    hyprpaper
    waybar

    swaybg

    hackgen-font
  ];

  services.hypridle.enable = true;

}
