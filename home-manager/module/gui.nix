{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    vivaldi

    hyprlock
    hyprpaper
    hyprpolkitagent
    waybar

    hackgen-font
  ];

  services.hypridle.enable = true;

}
