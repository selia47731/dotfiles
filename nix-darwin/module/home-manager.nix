{ user, homeDirectory, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
    inherit user homeDirectory;
    };

    users.selia = import ../../home-manager/home.nix;
  };
}
