{ pkgs, ... }:

{
  xdg = {
    enable = true;
    mime.enable = true;
    
    portal = {
      enable = true;
      
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
    };
    
    terminal-exec = {
      enable = true;
      
      settings = {
        default = [ "kitty.desktop" "xterm.desktop" ];
      };
    };
    
    userDirs = {
      enable = true;

      download = "$HOME/kama";
      pictures = "$HOME/sitelen";
      videos = "$HOME/sitelen-tawa";
      music = "$HOME/kalama";
      documents = "$HOME/lipu";
      
      desktop = "$HOME";
      publicShare = null;
      templates = null;
    };
  };
}
