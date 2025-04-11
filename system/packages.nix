{ pkgs, ... }:

{
  nixpkgs.config.pulseaudio = true;
  services.xserver.windowManager.bspwm.enable = true;

  environment.systemPackages = with pkgs; [
    bash
    git
    killall
    tree
    unzip
    vim
    wget
  ];
}
