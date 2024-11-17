flake-overlays:

{ inputs, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      eren = import ./home.nix;
    };
  };

  nixpkgs.overlays = flake-overlays;
}
