{ pkgs, ... }:

{
  services = {
    xserver.windowManager.bspwm.enable = true;
    flatpak.enable = true;
    mullvad-vpn.enable = true;
    qbittorrent.enable = true;
    ratbagd.enable = true;
    zerotierone.enable = true;
  };
  
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    bash.enable = true;
    dconf.enable = true; # needed for setting gtk theme
    evolution.enable = true;
    git.enable = true;
    gnupg.agent.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs; [
        obs-studio-plugins.input-overlay
        obs-studio-plugins.obs-vaapi
      ];
    };
    steam.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  environment.systemPackages = with pkgs; let
    dotnet = with pkgs.dotnetCorePackages; combinePackages [ dotnet_8.sdk ];
  in [
    ani-cli
    audacious
    beyond-all-reason
    btop
    croc
    crosspipe
    dolphin-emu
    dotnet
    eog
    equibop
    feh
    file
    file-roller
    firejail
    fluffychat
    foliate
    fractal
    gcc
    gh
    gImageReader
    gimp
    gnome-tetravex
    gnumake
    godot-mono
    heroic
    keepassxc
    killall
    libresprite
    librewolf
    lmms
    luanti
    lutris
    magic-wormhole
    mangohud
    memento
    # mindustry
    mpv
    mumble
    nemo-with-extensions
    odin
    olympus
    openjdk17-bootstrap
    osu-lazer-bin
    pavucontrol
    piper
    prismlauncher
    # python312
    # python312Packages.manga-ocr
    ruffle
    rustdesk-flutter
    rustup
    signal-desktop
    tetrio-desktop
    tor-browser
    tree
    unar
    unzip
    vim
    # vintagestory
    # warzone2100
    wget
    wine64Packages.stagingFull
    winetricks
    xclip
    xonotic
    zip
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # unfree
  nixpkgs.config.allowUnfree = true;
}
