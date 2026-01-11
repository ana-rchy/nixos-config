{ pkgs, ... }:

{
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  
  xdg = {
    portal = {
      enable = true;

      extraPortals = with pkgs; [ xdg-desktop-portal-shana xdg-desktop-portal-xapp ];
      config.common.default = [ "*" ];
    };
  };
 }
