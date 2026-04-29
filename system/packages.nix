{ inputs, config, pkgs, pkgs-stable, ... }:

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

  # HACK: needed to use nixpkgs-stable which is needed for older version of flameshot
  _module.args.pkgs-stable = import inputs.nixpkgs-stable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
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

    pkgs-stable.flameshot
  ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
  
  programs.steam.enable = true;
}
