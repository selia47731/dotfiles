{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    vivaldi
    chromium
    google-chrome

    hyprlock
    hyprpolkitagent
    hyprpaper
    waybar

    swaybg

    hackgen-font
  ];

  services.hypridle.enable = true;

}
