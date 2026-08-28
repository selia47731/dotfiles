{ user, homeDirectory, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
    inherit user homeDirectory;
    };

    users.selia = import ../../home-manager/home.nix;
  };
}
