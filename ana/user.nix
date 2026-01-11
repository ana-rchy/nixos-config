{ pkgs, ... }:

{
  users.users.ana = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "gamemode" ];

    shell = pkgs.zsh;
  };
}
