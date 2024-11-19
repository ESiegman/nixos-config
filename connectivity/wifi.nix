{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    #firewall = {
    #  enable = true;
    #  allowedTCPPorts = [ 22 80 443 ];
    #  allowedUDPPorts = [ 53 ];
    #};
  };
  programs.nm-applet.enable = true;
  # VPN
  environment.systemPackages = with pkgs; [
    wgnord
    wireguard-tools
  ];
}
