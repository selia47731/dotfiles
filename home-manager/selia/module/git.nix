{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;

      extraConfig = {
        core.editor = "nvim";
      };
    };
  };

  home.packages = with pkgs; [
    git-filter-repo
    lazygit
    ghq
  ];
}
