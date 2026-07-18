{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
    let
      host = import ./nix-darwin/selia/host-vars.nix;
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#selia
      darwinConfigurations.selia = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self host; };

        modules = [
          ./nix-darwin/selia/configuration.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = { inherit host; };

            home-manager.users.selia = import ./home-manager/selia/home.nix;
          }
        ];
      };
    };
}
