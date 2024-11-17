{ pkgs, ... }:

{
  programs = {
    # Enable Hyprland
    hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland.enable = true;
    };
    # Enable Waybar
    waybar = {
      enable = true;
      package = pkgs.waybar;
    };
  };

  # Desktop Portal
  services.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment = {
    sessionVariables = {
      # If cursor is invisible, set to "1"
      WLR_NO_HARDWARE_CURSORS = "0";
      # Tell Electron apps to use XWayland
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      mako # Notification daemon
      libnotify # Notification library
      swww # Wallpaper daemon
      kitty # Terminal emulator
      wofi # Application launcher
      brightnessctl # Control screen brightness
      wl-clipboard # Clipboard manager
      hyprshot # Screenshot tool
      wlogout # Logout menu
    ];
  };
}
