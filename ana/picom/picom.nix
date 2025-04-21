{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    picom
  ];
  
  home.file.".config/picom/picom.conf".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/ana/picom/picom.conf";
}
