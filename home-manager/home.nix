{ pkgs, ... }:

{
  imports = [
    ./hyprland-config.nix
    ./zsh-config.nix
    ./git-config.nix
    ./nvim-config.nix
  ];
  home = {
    username = "eren";
    homeDirectory = "/home/eren";
    stateVersion = "24.05";

    packages = [
      pkgs.zsh-powerlevel10k
    ];

    file = { };

    sessionVariables = {
      EDITOR = "nvim";
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
  };
}
