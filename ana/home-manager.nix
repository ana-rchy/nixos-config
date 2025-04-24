{ pkgs, pkgs-godot, ... }:

{
  programs = {
    feh.enable = true;
    gh.enable = true;
    kitty.enable = true;
    librewolf.enable = true;
    nheko.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home = {
    packages = with pkgs; [
      dotnetCorePackages.sdk_8_0-bin
      eog
      file-roller
      gcc
      gnumake
      lutris
      nemo-with-extensions
      prismlauncher
      rustup
      signal-desktop-bin
      tetrio-desktop
      vesktop
      
      pkgs-godot.godot-mono
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
