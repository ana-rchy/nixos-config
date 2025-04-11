{
  imports = [
    ./hardware-configuration.nix

    ./backlight.nix
    ./gpu.nix
    ./network.nix
    ./user.nix
    ./x11.nix
  ];

  system.stateVersion = "24.11";
}
