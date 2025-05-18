{ pkgs, pkgs-godot, pkgs-olympus, ... }:

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
      dotnetCorePackages.sdk_8_0-bin
      eog
      file-roller
      gcc
      gnumake
      helvum
      librewolf
      lutris
      nemo-with-extensions
      pavucontrol
      prismlauncher
      rustup
      signal-desktop-bin
      tetrio-desktop
      vesktop
      
      pkgs-godot.godot-mono
      
      pkgs-olympus.olympus
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
