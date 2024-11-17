# flake.nix
{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    stylix = "github:danth/stylix";

    nix-matlab = {
      url = "github:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  output = { self, nixpkgs, nix-matlab, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      flake-overlays = [ nix-matlab.overlay ];
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = { inherit inputs system; };
        modules = [
          (import ./configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.homeManagerModules.nixvim
            flake-overlays
          )
        ];
      };
    };
}
