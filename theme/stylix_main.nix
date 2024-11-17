{ pkgs, ... }:

{
  stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibate-Modern-Ice";
      size = "24";
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
        package = pkgs.nerdfonts.override { fonts = [ "Cascadia Code" ]; };
        name = "Cascadia Code Nerd Font";
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
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
    polarity = "dark";
  };
}
