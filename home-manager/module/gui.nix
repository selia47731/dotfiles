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

    hackgen-font
  ];

  services.hypridle.enable = true;

}
