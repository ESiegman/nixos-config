{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./connectivity/wifi.nix
    ./connectivity/bluetooth.nix
    ./hardware/nvidia.nix
    ./hardware/pipewire.nix
    ./theme/stylix.nix
    ./users/user.nix
    ./software/system-processes.nix
    ./software/nvim.nix
    ./software/games.nix
    ./software/devtools.nix
    ./software/programs.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      eren = import ./home-manager/home.nix;
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
