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
              sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#"$PROFILE"
              echo "✅ Update complete!"
            ''
          );
        };
        apps.hm = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "hm-script" ''
              set -e
              PROFILE=''${1}
              echo "🏠 Switching home-manager ($PROFILE)..."
              nix run home-manager -- switch --flake .#"$PROFILE"
              echo "✅ Done!"
            ''
          );
        };
        apps.darwin = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "darwin-script" ''
              set -e
              PROFILE=''${1}
              echo "🍎 Switching nix-darwin ($PROFILE)..."
              sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#"$PROFILE"
              echo "✅ Done!"
            ''
          );
        };
        apps.gc = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "gc-script" ''
              set -e
              echo "🧹 Deleting old generations..."
              nix profile wipe-history --older-than 7d 2>/dev/null || true
              echo "🗑️ Running garbage collection..."
              nix store gc
              echo "✅ GC complete!"
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
              services.openssh.enable = true;
            }
          ];
        };
        "work@mbp" = nix-darwin.lib.darwinSystem {
          modules = [
            ./nix/darwin
            {
              system.primaryUser = "higuchi";
              services.openssh.enable = false;
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
