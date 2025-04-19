{ pkgs, ... }:

{
  gtk = {
    enable = true;
    
    theme.name = "Nightfox-Dark";
    theme.package = pkgs.nightfox-gtk-theme;
    
    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.papirus-icon-theme;
    
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
