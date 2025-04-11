{ pkgs, config, home-manager, ... }:

{
  services.flameshot.enable = true;

  programs.feh.enable = true;
  programs.gh.enable = true;
  programs.kitty.enable = true;
  programs.librewolf.enable = true;
  programs.neovim.enable = true;
  programs.starship.enable = true;

  home = {
    packages = with pkgs; [
      nemo-with-extensions
      neofetch
      picom
      vesktop
    ];

    file = {
      ".config/picom/picom.conf".source = ./picom.conf; # manual config, because home-managers picom option, doesnt support the picom window rules config
      ".config/starship.toml".source = ./starship.toml;
      ".config/sxhkd/sxhkdrc".source = ./bspwm/sxhkdrc;
    };
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
}
