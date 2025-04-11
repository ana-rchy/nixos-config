{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, impermanence, home-manager, ... }: {
    nixosConfigurations.PhoneWave = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./system
	./system/_desktop

	./ana/user.nix
	./ana/_desktop/user.nix

	impermanence.nixosModules.impermanence

	home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ana = ./ana/home-manager.nix;
        }
      ];
    };

    nixosConfigurations.carbomb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./system
	./system/_laptop

        ./ana/user.nix
	./ana/_laptop/user.nix

	impermanence.nixosModules.impermanence

	home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.users.ana.imports = [
            ./ana
	    ./ana/_laptop
	  ];
        }
      ];
    };
  };
}
