{
  user,
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    inherit user;
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;


    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };


    brews = [
      "mlx"
      "mlx-c"
      "ollama"
    ];

    casks = [
      # Utility
      "blackhole-16ch"
      "blackhole-2ch"
      "linearmouse"
      "qfinder-pro"
      "keycastr"
      "omniwm"

      # Tools
      "deepl"
      "nessus"

      # Communication
      "discord"
      "slack"
      "mattermost"
      "zoom"

      # Microsoft
      "microsoft-teams"
      "microsoft-powerpoint"

      # Fonts
      "font-hack-nerd-font"
      "font-hackgen"
      "font-monaspace"

      # Terminal / Editor
      "zed"

      # IME
      "macskk"

      # Browser
      "google-chrome"
      "vivaldi"

      # Tex
      "mactex-no-gui"
      "skim"
    ];

    taps = [
    ];
  };
}
