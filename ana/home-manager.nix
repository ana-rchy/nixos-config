{pkgs, ...}:

{
  programs.feh.enable = true;
  programs.gh.enable = true;
  programs.kitty.enable = true;
  programs.librewolf.enable = true;

  home = {
    packages = with pkgs; [
      dotnet-runtime_9
      dotnet-sdk_9
      eog
      file-roller
      gcc
      gnumake
      lutris
      nemo-with-extensions
      rustup
      vesktop
    ];
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
