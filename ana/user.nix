{ pkgs, ... }:

{
  users.users.ana = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.

    shell = pkgs.zsh;
  };
}
