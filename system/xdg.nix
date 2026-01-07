{ pkgs, ... }:

{
  xdg = {
    mime.enable = true;
    
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      
      extraPortals = with pkgs; [ xdg-desktop-portal-shana xdg-desktop-portal ];
      config.common.default = [ "shana" ];
    };
    
    terminal-exec = {
      enable = true;
      
      settings = {
        default = [ "kitty.desktop" "xterm.desktop" ];
      };
    };
  };
}
