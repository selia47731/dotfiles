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

    global.autoUpdate = false;

    onActivation = {
      cleanup = "uninstall";
    };

    brews = [
      "borders"
      "mlx"
      "mlx-c"
      "ollama"
    ];

    casks = [
      # Utility
      "appcleaner"
      "blackhole-16ch"
      "blackhole-2ch"
      "linearmouse"
      "qfinder-pro"
      "keycastr"

      # Tools
      "chatgpt"
      "deepl"
      "claude"

      # Communication
      "discord"
      "slack"
      "mattermost"
      "microsoft-teams"
      "zoom"

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
      {
        name = "felixkratz/formulae";
        trusted = true;
      }
    ];
  };
}
