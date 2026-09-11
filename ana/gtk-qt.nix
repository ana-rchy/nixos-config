{ pkgs, ... }:

let
  oldNixpkgs = builtins.fetchTarball {
    # nixpkgs before gtk-engine-murrine was removed
    url = "https://github.com/NixOS/nixpkgs/archive/8b6f14f4784332928303694d851c366938493657.tar.gz";
    sha256 = "sha256-5XefNsRKyBvPz7pBnhOeWRaWw/VQua+3F32BzLO5NgU=";
  };
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    nightfox-gtk-theme = self.callPackage (oldNixpkgs + "/pkgs/by-name/ni/nightfox-gtk-theme/package.nix") {};
    gtk-engine-murrine = self.callPackage (oldNixpkgs + "/pkgs/by-name/gt/gtk-engine-murrine/package.nix") {};
  });
in
{
  gtk = {
    enable = true;
    
    theme.name = "Nightfox-Dark";
    theme.package = scope.nightfox-gtk-theme;
    
    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.papirus-icon-theme;
    
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    
    gtk4.theme = null;
  };
}
