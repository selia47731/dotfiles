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
      "appcleaner"
      "blackhole-16ch"
      "blackhole-2ch"
      "linearmouse"
      "qfinder-pro"
      "keycastr"
      "omniwm"

      # Tools
      "chatgpt"
      "deepl"
      "claude"
      "codex"

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
    ];
  };
}
