{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cmake
      lua5_1
      lua51Packages.luarocks
      deno
      nodejs
      uv
      tree-sitter
      stylua
      selene
      shellcheck
      automake
      boost
    ];
  };
}
