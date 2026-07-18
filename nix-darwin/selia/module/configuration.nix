{ user, hostPlatform, self, nixpkgs, ... }:

{
  system = {
    stateVersion = 6;
    primaryUser = user;

    configurationRevision = self.rev or self.dirtyRev or null;
  };

  users.users.${user}.home = "/Users/${user}";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
