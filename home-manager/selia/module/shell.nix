{ pkgs, ... }:

{
  programs = {
    zsh.enable = true;

    bat.enable = true;

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    tmux = {
      enable = true;

      prefix = "C-a";
      mouse = true;
      keyMode = "vi";
      historyLimit = 50000;
      terminal = "tmux-256color";

      plugins = with pkgs.tmuxPlugins; [
        sensible
      ];
    };
  };

  home.packages = with pkgs; [
    fd
    nkf
    zinit
  ];
}
