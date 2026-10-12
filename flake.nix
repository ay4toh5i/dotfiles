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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    agent-skills.url = "github:Kyure-A/agent-skills-nix";
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };
    mattpocock-skills = {
      url = "github:mattpocock/skills";
      flake = false;
    };
    natural-japanese-skills = {
      url = "github:coji/natural-japanese";
      flake = false;
    };
    crit-skills = {
      url = "github:tomasz-tomczyk/crit";
      flake = false;
    };
    herdr-skills = {
      url = "github:herdrdev/herdr/v0.8.2";
      flake = false;
    };
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
        # Unauthenticated GitHub API requests are rate limited per IP, which makes
        # `nix flake update` fail with HTTP 403. Reuse the gh CLI token when available.
        ghTokenPrelude = ''
          if command -v gh > /dev/null 2>&1; then
            GH_API_TOKEN=$(gh auth token 2> /dev/null || true)
            if [ -n "$GH_API_TOKEN" ]; then
              export NIX_CONFIG="access-tokens = github.com=$GH_API_TOKEN"
            fi
          fi
        '';
      in
      {
        apps.update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              PROFILE=''${1}
              ${ghTokenPrelude}
              echo "❄️ Updating flake..."
              nix flake update
              echo "🏠 Updating home-manager ($PROFILE)..."
              nix run home-manager -- switch --flake .#"$PROFILE"
              echo "🍎 Updating nix-darwin ($PROFILE)..."
              sudo NIX_CONFIG="''${NIX_CONFIG-}" nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#"$PROFILE"
              echo "✅ Update complete!"
            ''
          );
        };
        apps.switch = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "switch-script" ''
              set -e
              PROFILE=''${1}
              ${ghTokenPrelude}
              echo "🏠 Switching home-manager ($PROFILE)..."
              nix run home-manager -- switch --flake .#"$PROFILE"
              echo "🍎 Switching nix-darwin ($PROFILE)..."
              sudo NIX_CONFIG="''${NIX_CONFIG-}" nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#"$PROFILE"
              echo "✅ Done!"
            ''
          );
        };
        apps.hm = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "hm-script" ''
              set -e
              PROFILE=''${1}
              ${ghTokenPrelude}
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
              ${ghTokenPrelude}
              echo "🍎 Switching nix-darwin ($PROFILE)..."
              sudo NIX_CONFIG="''${NIX_CONFIG-}" nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#"$PROFILE"
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
            ./nix/home-manager/zen-browser/pins-personal.nix
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
            ./nix/home-manager/zen-browser/pins-work.nix
            {
              home.username = "higuchi";
              home.homeDirectory = "/Users/higuchi";
            }
          ];
        };
      };
    };
}
