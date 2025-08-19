{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./display-manager.nix
    ./firewall.nix
    ./fonts.nix
    ./home-manager.nix
    ./input.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./persistence.nix
    ./user.nix
    ./x11.nix
    ./zsh.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
