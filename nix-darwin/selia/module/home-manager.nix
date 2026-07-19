{ user, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
    inherit user;
    };

    users.selia = import ../../../home-manager/selia/home.nix;
  };
}
