{
  self,
  user,
  hostPlatform,
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
