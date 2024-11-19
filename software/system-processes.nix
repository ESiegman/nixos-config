{ pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  systemd.services.systemd-modules-load.enable = true;

  services = {
    udev.enable = true;
    dbus.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "modesetting" "nvidia" ];
    };
    displayManager.sddm.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = [
          "hyprland"
        ];
      };
    };
  };

  security.polkit.enable = true;

  environment = {
    variables.XDG_RUNTIME_DIR = "/run/user/1000";
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "0";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      libnotify
      waybar
      wofi
      brightnessctl
      mako
      wl-clipboard
      wlogout
      brightnessctl
      hyprshot
    ];
  };

  time.timeZone = "America/New_York";
}

