{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    vivaldi
    chromium

    hyprlock
    hyprpolkitagent
    hyprpaper
    waybar

    swaybg

    hackgen-font
  ];

  services.hypridle.enable = true;

}
