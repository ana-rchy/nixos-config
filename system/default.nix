{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./clamav.nix
    ./display-manager.nix
    ./firewall.nix
    ./fonts.nix
    ./gamemode.nix
    ./home-manager.nix
    # ./i2p.nix
    ./input.nix
    # ./jellyfin.nix
    ./locale.nix
    # ./lock-screen.nix  # need to figure out how to make this work
    ./logind.nix
    ./network.nix
    ./opentabletdriver.nix
    ./packages.nix
    ./persistence-impermanence.nix
    ./qmk.nix
    ./user.nix
    ./virt-manager.nix
    ./x11.nix
    ./xdg.nix
    ./zsh.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
