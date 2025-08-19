{pkgs, ...}: {
  nixpkgs.config.pulseaudio = true;
  
  services = {
    xserver.windowManager.bspwm.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    openvpn.servers = {
      meow = { config = '' config /home/ana/vpn.conf ''; };
    };
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

  environment.systemPackages = with pkgs; [
    bash
    btop
    file
    git
    killall
    miniupnpc
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
  
  programs.steam = {
    enable = true;
    extraPackages = [ pkgs.adwsteamgtk ];
  };
  
  # insecure
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-runtime-7.0.20"
    "olm-3.2.16" # allow nheko on system
  ];
}
