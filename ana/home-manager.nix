{ pkgs, pkgs-godot, ... }:

{
  programs = {
    feh.enable = true;
    gh.enable = true;
    kitty.enable = true;
    mpv.enable = true;
    nheko.enable = true;
    obs-studio.enable = true;
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
      appimage-run
      croc
      dotnet-sdk
      eog
      equibop
      file-roller
      firejail
      foliate
      gcc
      gimp
      gnumake
      helvum
      libresprite
      librewolf
      lutris
      nemo-with-extensions
      pavucontrol
      piper
      prismlauncher
      rustup
      signal-desktop-bin
      tetrio-desktop
      vintagestory
      
      pkgs-godot.godot-mono
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
