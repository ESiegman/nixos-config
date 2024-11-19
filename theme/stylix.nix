{ pkgs, ... }:

let
  wallpaper = /home/eren/Pictures/wallpapers/cute.jpg;
in

{
  stylix = {
    enable = true;
    image = wallpaper;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
        name = "FiraCode Nerd Font";
      };
      serif = {
        package = pkgs.nerdfonts.override { fonts = [ "IosevkaTermSlab" ]; };
        name = "IosevkaTermSlab Nerd Font";
      };
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 12;
        popups = 12;
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 0.5;
      popups = 1.0;
    };
    polarity = "dark";
  };
}
