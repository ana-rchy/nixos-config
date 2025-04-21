{ config, ... }:

{
  programs.starship.enable = true;
  
  home.file.".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/ana/starship/starship.toml";
}
