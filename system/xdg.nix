{ pkgs, ... }:

{
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  
  xdg = {
    mime = {
      enable = true;
      
      addedAssociations = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        
        "inode/directory" = "nemo.desktop";
        "inode" = "nemo.desktop";
        
        "text/plain" = "neovim.desktop";
      };
    };

    portal = {
      enable = true;

      extraPortals = with pkgs; [ xdg-desktop-portal-shana xdg-desktop-portal-xapp ];
      config.common.default = [ "*" ];
    };
  };
 }
