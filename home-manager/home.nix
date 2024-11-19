{ ... }:

{
  imports = [
    ./hyprland.nix
    ./zsh.nix
    ./git.nix
    ./programs.nix
    ./kitty.zsh
    ./fastfetch.nix
    ./waybar.nix
#    ./hyprlock.nix
  ];
  home = {
    username = "eren";
    homeDirectory = "/home/eren";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  programs = {
    home-manager.enable = true;
  };
  xdg.mimeApps.defaultApplications = {
    "text/plain" = "nvim.desktop";
    "application/pdf" = "zathura.desktop";
    "image/*" = "gThumb.desktop";
    "video/*" = "mpv.desktop";
    "audio/*" = "mpv.desktop";
  };
  stylix.targets.waybar.enable = false;
}
