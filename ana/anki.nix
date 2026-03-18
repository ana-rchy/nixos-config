{ pkgs, ... }:

{
  programs.anki = {
    enable = false;
    
    addons = [
      pkgs.ankiAddons.anki-connect
    ];
  };
}
