{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    vivaldi

    hyprlock
    hyprpolkitagent
    waybar

    hackgen-font
  ];

  services.hypridle.enable = true;
  services.hyprpaper.enable = true;

}
