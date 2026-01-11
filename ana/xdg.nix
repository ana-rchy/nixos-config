{ pkgs, ... }:

{
  xdg = {
    mime.enable = true;
    
    mimeApps = {
      enable = true;
      
      defaultApplications = {
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
      # xdgOpenUsePortal = true;
      
      extraPortals = with pkgs; [ xdg-desktop-portal-shana xdg-desktop-portal-xapp ];
      config.common.default = [ "*" ];
    };
    
    userDirs = {
      enable = true;

      download = "$HOME/kama";
      pictures = "$HOME/sitelen";
      videos = "$HOME/sitelen-tawa";
      music = "$HOME/kalama";
      documents = "$HOME/lipu/ijo/";
      
      desktop = "$HOME/supa/";
      publicShare = null;
      templates = null;
    };
  };
}
