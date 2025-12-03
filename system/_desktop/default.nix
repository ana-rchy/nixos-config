{
  imports = [
    ./hardware-configuration.nix

    ./autorandr.nix
    ./ckb-next.nix
    ./gpu.nix
    ./network.nix
    ./user.nix
    ./vr.nix
  ];

  system.stateVersion = "25.11";
}
