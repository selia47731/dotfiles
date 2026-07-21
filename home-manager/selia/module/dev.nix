{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    lua5_1
    luarocks
    deno
    nodejs
    tree-sitter
    stylua
    selene
    shellcheck
    automake
    boost
  ];
}
