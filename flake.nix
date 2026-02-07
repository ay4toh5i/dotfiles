{
  # Basic commands:
  # nix run .#update
  # nix store gc
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem(
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.tools = pkgs.buildEnv {
          name = "tools";
          paths = [];
        };

        apps.update = {
          type = "app";
          program = toString (pkgs.writeShellScript "update-script" ''
            set -e
            echo "❄️ Updating flake..."
            nix flake update
            echo "🏠 Updating home-manager..."
            nix run home-manager -- switch --flake .#ayato
            echo "🍎 Updating nix-darwin..."
            sudo nix run nix-darwin -- switch --flake .#Ayatos-MacBook-Pro
            echo "✅ Update complete!"
          '');
        };
      }
    ) // {
      darwinConfigurations = {
        "Ayatos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = [ ./nix/darwin ];
        };
      };
      homeConfigurations = {
        "ayato" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./nix/home-manager/macos.nix ];
        };
      };
    };
}
