{
  description = "Personal NixOS configs for Desktop + Toshiba laptop";

  inputs = {
    # ── Nixpkgs ─────────────────────────────────────────────────────────────
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url   = "github:nixos/nixpkgs/nixos-25.11";

    # ── Home Manager ────────────────────────────────────────────────────────
    home-manager.url = "github:nix-community/home-manager";

    # ── Personal Packages ───────────────────────────────────────────────────
    personal-pkgs-nix.url = "github:izen67/personal-pkgs-nix";

    # ── Noctalia ────────────────────────────────────────────────────────────
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-stable, home-manager, personal-pkgs-nix, ... }@inputs:
  let
    # Overlay for personal packages
    globalOverlays = personal-pkgs-nix.overlays.x86_64-linux;
  in {
    nixosConfigurations = {
      # ──────────────────────────────── PC ────────────────────────────────
      pc = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "izen";
        };
        modules = [
          ./common/default.nix
          ./hosts/pc/default.nix

          { nixpkgs.overlays = globalOverlays; }

          # Home Manager (unstable)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-unstable;
            };
          }
        ];
      };

      # ──────────────────────────────── TOSHIBA ─────────────────────────────
      toshiba = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "toshiba";
        };
        modules = [
          ./common/default.nix
          ./hosts/toshiba/default.nix

          { nixpkgs.overlays = globalOverlays; }

          # Home Manager (stable)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-stable;
            };
          }
        ];
      };
    };
  };
}

