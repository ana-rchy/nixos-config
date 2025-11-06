{
  imports = [
    ./hardware-configuration.nix

    ./network.nix
    ./user.nix
  ];

  system.stateVersion = "25.11";
}
