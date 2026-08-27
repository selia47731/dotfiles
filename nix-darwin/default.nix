{
  self,
  user,
  hostPlatform,
  homeDirectory,
  ...
}:
{
  imports = [
    ./module/configuration.nix
    ./module/homebrew.nix
    ./module/home-manager.nix
    ./module/nixpkgs.nix
  ];
}
