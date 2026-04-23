{ pkgs, ... }:

{
  programs = {
    feh.enable = true;
    gh.enable = true;
    kitty.enable = true;
    mpv.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs; [
        obs-studio-plugins.input-overlay
        obs-studio-plugins.obs-vaapi
      ];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  
  services = {
    syncthing.enable = true;
  };

  home = {
    packages = with pkgs; [
      adwsteamgtk
      ani-cli
      appimage-run
      audacious
      beyond-all-reason
      bolt-launcher
      croc
      crosspipe
      dotnet-sdk
      eog
      equibop
      evolution
      file-roller
      firejail
      foliate
      gcc
      gImageReader
      gimp
      gnome-tetravex
      gnumake
      godot-mono
      heroic
      keepassxc
      libresprite
      librewolf
      lmms
      luanti
      lutris
      magic-wormhole
      mangohud
      memento
      mindustry
      mumble
      nemo-with-extensions
      openjdk17-bootstrap
      osu-lazer-bin
      pavucontrol
      prismlauncher
      python312
      qbittorrent
      ruffle
      rustup
      ryubing
      signal-desktop
      tetrio-desktop
      vintagestory
      warzone2100
      xonotic
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
