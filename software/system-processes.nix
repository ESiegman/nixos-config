{ inputs, pkgs, lib, ... }:

let
  wallpaper = /home/eren/Pictures/wallpapers/sunset.jpg;
in

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = inputs.nixos-grub-themes.packages.${pkgs.system}.hyperfluent;
    };
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
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      sugarCandyNix = {
        enable = true;
        settings = {
          Background = lib.cleanSource wallpaper;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
        };
      };
    };
    gvfs.enable = true;
    tumbler.enable = true;
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

  security = {
    pam.services.hyprlock = {};
    polkit.enable = true;
  };

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
      playerctl
      mesa-demos
      glxinfo
    ];
  };
  
  programs = {
    hyprland.enable = true;
    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
  time.timeZone = "America/New_York";
}

