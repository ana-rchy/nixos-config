{pkgs, ...}: {
  nixpkgs.config.pulseaudio = true;
  services.xserver.windowManager.bspwm.enable = true;
  programs.dconf.enable = true; # needed for setting gtk theme

  environment.systemPackages = with pkgs; [
    bash
    btop
    file
    git
    killall
    tree
    unzip
    vim
    wget
    wine-staging
    winetricks
    xclip
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
  
  # insecure
  nixpkgs.config.permittedInsecurePackages = with pkgs; [
    "olm-3.2.16" # allow nheko on system
  ];
}
