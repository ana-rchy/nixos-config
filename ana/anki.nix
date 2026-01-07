{ pkgs, ... }:

{
  programs.anki = {
    enable = true;
    
    addons = [
      pkgs.ankiAddons.anki-connect
    ];
  };
}
