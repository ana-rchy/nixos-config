{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    hyfetch
  ];
  
  home.file.".config/hyfetch.json".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/ana/fetch/hyfetch.json";
}
