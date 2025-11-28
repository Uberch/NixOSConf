{
	description = "Basic system configuration";

	inputs = {
		# General package repo
		nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
		
		# Home-manager
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Stylix
		stylix = {
			url = "github:nix-community/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Nixvim
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs: let
		# General variables
		system = "x86_64-linux";
		homeStateVersion = "25.05";
		user = "uber";
		hosts = [
			{ hostname = "nixos"; stateVersion = homeStateVersion; }
		];

		# # Function to make system configuration
		# makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
		# 	system = system;
		# 	specialArgs = {
		# 		inherit inputs stateVersion hostname user;
		# 	};
		#
		# 	modules = [
		# 		./hosts/${hostname}/configuration.nix
		# 	];
		# };
	in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				inputs.stylix.nixosModules.stylix
				./hosts/nixos/configuration.nix
				./modules
			];
		};

		homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			extraSpecialArgs = { inherit inputs homeStateVersion user; };
			modules = [
				inputs.stylix.homeModules.stylix
				./home-manager/home.nix
			];
		};
	};
}
