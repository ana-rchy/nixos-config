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
    ./input.nix
    ./locale.nix
    ./lock-screen.nix
    ./logind.nix
    ./network.nix
    ./opentabletdriver.nix
    ./packages.nix
    ./persistence-impermanence.nix
    ./qmk.nix
    ./user.nix
    ./virt-manager.nix
    ./virtualbox.nix
    ./x11.nix
    ./xdg.nix
    ./zsh.nix
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
