{ config, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/dotfiles";
in
{
  xdg.configFile = {
    "nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/nvim";
      recursive = true;
    };

    "wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/wezterm";
      recursive = true;
    };

    "zeno" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/zsh/zeno";
      recursive = true;
    };

    "zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/zsh/zsh";
      recursive = true;
    };
  };

  home.file.".zshrc" = {
    source = ../../../zsh/.zshrc;
  };
}
