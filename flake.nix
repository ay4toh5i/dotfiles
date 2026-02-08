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
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        apps.update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              PROFILE=''${1}
              echo "❄️ Updating flake..."
              nix flake update
              echo "🏠 Updating home-manager ($PROFILE)..."
              nix run home-manager -- switch --flake .#"$PROFILE"
              echo "🍎 Updating nix-darwin ($PROFILE)..."
              sudo nix run nix-darwin -- switch --flake .#"$PROFILE"
              echo "✅ Update complete!"
            ''
          );
        };
      }
    )
    // {
      darwinConfigurations = {
        "personal@mbp" = nix-darwin.lib.darwinSystem {
          modules = [
            ./nix/darwin
            {
              system.primaryUser = "ayato";
            }
          ];
        };
        "work@mbp" = nix-darwin.lib.darwinSystem {
          modules = [
            ./nix/darwin
            {
              system.primaryUser = "higuchi";
            }
          ];
        };
      };
      homeConfigurations = {
        "personal@mbp" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./nix/home-manager/macos.nix
            {
              home.username = "ayato";
              home.homeDirectory = "/Users/ayato";
            }
          ];
        };
        "work@mbp" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./nix/home-manager/macos.nix
            {
              home.username = "higuchi";
              home.homeDirectory = "/Users/higuchi";
            }
          ];
        };
      };
    };
}
