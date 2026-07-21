{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;

      settings = {
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
