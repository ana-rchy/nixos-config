{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-godot.url = "github:nixos/nixpkgs/2631b0b7abce";
    nixpkgs-olympus.url = "github:Petingoso/nixpkgs/olympus";
    
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

  outputs = { nixpkgs, nixpkgs-godot, nixpkgs-olympus, impermanence, home-manager, nvf, ... }: {
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
	    ];
	  };
	  
	  extraSpecialArgs = {
	    pkgs-godot = nixpkgs-godot.legacyPackages."${system}";
	    pkgs-olympus = nixpkgs-olympus.legacyPackages."${system}";
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
	    ];
	    
	    extraSpecialArgs = {
	      pkgs-godot = nixpkgs-godot.legacyPackages."${system}";
	      pkgs-olympus = nixpkgs-olympus.legacyPackages."${system}";
	    };
	  };
	}
      ];
    };
    
  };
}
