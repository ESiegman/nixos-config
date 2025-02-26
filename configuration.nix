{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./connectivity/wifi.nix
    ./connectivity/bluetooth.nix
    ./hardware/nvidia.nix
    ./hardware/pipewire.nix
    ./theme/stylix.nix
    ./theme/stylix-wallpaper.nix
    ./users/user.nix
    ./software/system-processes.nix
#    ./software/nvim.nix
    ./software/nixvim.nix
    ./software/games.nix
    ./software/devtools.nix
    ./software/programs.nix
  ];

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 16GB
  }];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      eren = import ./home-manager/home.nix;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  environment.systemPackages = with pkgs; [
    matlab
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
