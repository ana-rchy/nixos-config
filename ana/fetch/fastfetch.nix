{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    fastfetch
  ];
  
  home.file.".config/fastfetch/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/ana/fetch/fastfetch.jsonc";
}
