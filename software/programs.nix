{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmatrix
    tgpt
    ueberzug
    zip
    unzip
    dolphin
    power-profiles-daemon

    obs-studio

    orca-slicer
    libreoffice

    gimp
    vlc

    spotify

    vesktop
    zoom
    teams-for-linux

    wine
  ];

  programs.waybar.enable = true;
}
