{ pkgs, ... }:

{
  programs = {
    feh.enable = true;
    gh.enable = true;
    kitty.enable = true;
    mpv.enable = true;
    nheko.enable = true;
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
      clamtk
      croc
      dotnet-sdk
      eog
      equibop
      evolution
      file-roller
      firejail
      foliate
      gcc
      gimp
      gnome-tetravex
      gnumake
      godot-mono
      helvum
      keepassxc
      libresprite
      librewolf
      lutris
      mangohud
      mindustry
      mumble
      nemo-with-extensions
      nss
      openjdk17-bootstrap
      osu-lazer-bin
      pavucontrol
      prismlauncher
      python312
      qbittorrent
      rustup
      signal-desktop-bin
      tetrio-desktop
      vintagestory
      # warzone2100
      xonotic
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
