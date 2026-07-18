{ host, self, pkgs, ... }:

{
  system = {
    stateVersion = 6;

    configurationRevision = self.rev or self.dirtyRev or null;
  };

  users.users.${host.username} = {
    home = host.homeDirectory;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
