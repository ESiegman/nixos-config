{ config, ... }:

{
  # Setup NVIDIA Graphics
  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      # Mode Setting Required
      modesetting.enable = true;
      # NVIDIA Power Management
      powerManagement = {
        enable = true; # May cause sleep/suspend issues
        finegrained = true; # Turns off GPU when not in use
      };

      # Open Source NVIDIA Driver
      open = false;

      # Enable NVIDIA Settings menu
      nvidiaSettings = true;

      # Choose NVIDIA Driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # Enable NVIDIA Prime
      prime = {
        # NVIDIA Prime Offload better stability than Prime Sync, but worse performance
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # NVIDIA Prime Sync better performance than Prime Offload, but more unstable 
        # and more power consumption
        sync.enable = false;

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
