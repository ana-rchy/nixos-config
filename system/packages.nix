{pkgs, ...}: {
  nixpkgs.config.pulseaudio = true;
  services.xserver.windowManager.bspwm.enable = true;

  environment.systemPackages = with pkgs; [
    bash
    file
    git
    killall
    tree
    unzip
    vim
    wget
    xclip
  ];
}
