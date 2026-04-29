{ pkgs, ... }:

{
  users.users.ana = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "gamemode" "video" ];

    shell = pkgs.zsh;
  };
}
