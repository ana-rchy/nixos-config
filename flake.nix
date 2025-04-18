{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, impermanence, home-manager, nvf, ... }: {
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
          home-manager = {
	    useGlobalPkgs = true;
            useUserPackages = true;
	    users.ana.imports = [
              ./ana
              ./ana/_laptop
	      nvf.homeManagerModules.default
	    ];
	  };
        }
      ];
    };
  };
}
