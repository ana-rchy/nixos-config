{ pkgs, ... }:

{
  nixpkgs.config.pulseaudio = true;
  
  services = {
    xserver.windowManager.bspwm.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    # openvpn.servers = {
    #   meow = { config = '' config /home/ana/vpn.conf ''; };
    # };
    udev.packages = with pkgs; [ via ];
  };
  
  programs = {
    dconf.enable = true; # needed for setting gtk theme
    firejail.enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };
  
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  environment.systemPackages = with pkgs; [
    bash
    btop
    file
    git
    killall
    miniupnpc
    piper
    tree
    unar
    unzip
    via
    vim
    wget
    winetricks
    wineWowPackages.stable
    xclip
    zip
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
  
  # insecure
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
    "olm-3.2.16" # allow nheko on system
  ];
}
