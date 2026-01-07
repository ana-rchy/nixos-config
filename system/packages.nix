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
    wineWowPackages.stable
    xclip
    zip
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
}
