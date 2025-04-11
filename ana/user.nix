{ pkgs, ... }:

{
  users.users.ana = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.

    shell = pkgs.zsh;
  };
}
