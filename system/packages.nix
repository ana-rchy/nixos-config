{ pkgs, hytale-launcher, ... }:

{
  nixpkgs.config.pulseaudio = true;
  
  services = {
    xserver.windowManager.bspwm.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    # openvpn.servers = {
    #   meow = { config = '' config /home/ana/vpn.conf ''; };
    # };
    
    zerotierone.enable = true;
  };
  
  programs = {
    dconf.enable = true; # needed for setting gtk theme
    firejail.enable = true;
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
    wine-staging
    xclip
    zip

    hytale-launcher.packages.x86_64-linux.default
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
}
