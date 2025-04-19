{pkgs, ...}: {
  nixpkgs.config.pulseaudio = true;
  services.xserver.windowManager.bspwm.enable = true;

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
}
