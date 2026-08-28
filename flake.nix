{
  description = "selia's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-homebrew,
    ...
  }:
    let
      hosts = {
        mac = {
          hostPlatform = "aarch64-darwin";
          user = "selia";
          hostname = "selia";
          homeDirectory = "/Users/selia";
        };

        nixos-arm64 = {
          system = "aarch64-linux";
          user = "selia";
          hostname = "nixos";
          homeDirectory = "/home/selia";
        };
      };
    in {
      darwinConfigurations.${hosts.mac.hostname} = {
        nix-darwin.lib.darwinSystem {
          specialArgs = {
          inherit self;
          inherit (hosts.mac) user hostPlatform homeDirectory;
          };

          modules = [
            ./nix-darwin

            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew

          ];
        };
      };

      nixosConfigurations.${hosts.nixos-arm64.hostname} =
      nixpkgs.lib.nlib.nixosSystem {
        system = hosts.nixos-arm64.system;

        specialArgs = {
          inherit self;
          inherit (hosts.nixos-arm64) user system homeDirectory;
          hostPlatform = hosts.nixos-arm64.system;
        };

        modules = [
          ./nixos

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit self inputs;
                inherit (hosts.nixos-arm64) user hostname;
                hostPlatform = hosts.nixos-arm64.system;
              };

              users.${hosts.nixos-arm64.user} =
                import ./home-manager/home.nix;
            };
          }
        ];
      };
    };
}
