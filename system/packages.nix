{ pkgs, ... }:

{
  services = {
    xserver.windowManager.bspwm.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    
    zerotierone.enable = true;
  };
  
  programs = {
    dconf.enable = true; # needed for setting gtk theme
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
    piper
    tree
    unar
    unzip
    vim
    wget
    wine64Packages.stagingFull
    winetricks
    xclip
    zip
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
}
