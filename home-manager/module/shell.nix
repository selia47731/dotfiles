{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;

      enableCompletion = true;

      initContent = ''
        PS1="selia %1~ %# "

        if [[ "$TERM_PROGRAM" == "WezTerm" ]]; then
          export LSCOLORS="exfxcxdxbxegedabagacad"
        fi

        cde() {
          local last_cmd=$(fc -ln -1)
          local -a last_cmd_words=(''${(z)last_cmd})
          local last_arg=''${last_cmd_words[-1]}

          if [[ -d $last_arg ]]; then
            cd -- "$last_arg"
          else
            print -u2 "cde: '$last_arg' is not a directory"
          fi
        }

        source ${pkgs.zinit}/share/zinit/zinit.zsh

        export ZENO_HOME="$HOME/.config/zeno"
        export ZENO_GIT_CAT="bat --color=always"
        export ZENO_GIT_TREE="eza --tree"
        export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1
        export ZENO_DISABLE_BUILTIN_COMPLETION=1
        zinit ice lucid depth"1" blockf
        zinit light yuki-yano/zeno.zsh
        zinit light zdharma-continuum/fast-syntax-highlighting
        export FAST_SYNTAX_HIGHLIGHTING_THEME="$HOME/.config/zsh/fsh-themes/aardvark-blue.fast-theme"
        bindkey ' ' zeno-auto-snippet
        bindkey '^m' zeno-auto-snippet-and-accept-line
        bindkey '^i' zeno-completion
        bindkey '^x ' zeno-insert-space
        bindkey '^x^m' accept-line
        bindkey '^x^z' zeno-toggle-auto-snippet
        bindkey '^r' zeno-history-selection
      '';
    };

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

  home = {
    packages = with pkgs; [
      neovim
      fd
      nkf
      ripgrep
      zinit
      unzip
    ];

    sessionPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
      "$HOME/.local/bin"
      "/usr/local/texlive/2026/bin/universal-darwin"
    ];

    sessionVariables = {
      MANPAGER = "nvim +Man!";
      CLICOLOR = "1";
      PUPPETEER_EXECUTABLE_PATH = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"; # MacOSでのみ利用可能(後で分離
    };
  };
}
