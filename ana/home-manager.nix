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
      plugins = [ pkgs.obs-studio-plugins.input-overlay ];
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
      appimage-run
      beyond-all-reason
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
      gnumake
      godot-mono
      helvum
      keepassxc
      libresprite
      librewolf
      lutris
      mindustry
      nemo-with-extensions
      openjdk17-bootstrap
      osu-lazer-bin
      pavucontrol
      piper
      prismlauncher
      python312
      rustup
      signal-desktop-bin
      tetrio-desktop
      vintagestory
      warzone2100
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
