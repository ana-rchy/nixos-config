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
    
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = { nixpkgs, impermanence, home-manager, nvf, nix-flatpak, ... }: {
    nixosConfigurations.PhoneWave = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      modules = [
        ./system
	./system/_desktop

	./ana/user.nix
	./ana/_desktop/user.nix

	impermanence.nixosModules.impermanence
	
	home-manager.nixosModules.home-manager {
          home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    users.ana.imports = [
              ./ana
              ./ana/_desktop
	      nvf.homeManagerModules.default
	      nix-flatpak.homeManagerModules.nix-flatpak
	    ];
	  };
	  
	  extraSpecialArgs = {
	    ##
	  };
        }
      ];
    };

    nixosConfigurations.carbomb = nixpkgs.lib.nixosSystem rec {
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
	      nix-flatpak.homeManagerModules.nix-flatpak
	    ];
	    
	    extraSpecialArgs = {
	      ##
	    };
	  };
	}
      ];
    };
    
  };
}
