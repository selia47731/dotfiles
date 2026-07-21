{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    luarocks
    deno
    tree-sitter
    stylua
    selene
    shellcheck
    automake
    boost
  ];
}
