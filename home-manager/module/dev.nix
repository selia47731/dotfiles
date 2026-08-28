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

    file = {
      ".luarocks/config-5.1.lua".text = ''
        lua_version = "5.1"

        arch = "macosx-aarch64"
        processor = "aarch64"
        target_cpu = "aarch64"
      '';

      ".luarocks/default-lua-version.lua".text = ''
        return "5.1"
      '';
    };
  };
}
