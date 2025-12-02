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

	outputs = {self, nixpkgs, home-manager, stylix, ...}@inputs: let
		# General variables
		system = "x86_64-linux";
		homeStateVersion = "25.05";
		user = "uber";
		hosts = [
			{ hostname = "nixos"; stateVersion = homeStateVersion; }
			{ hostname = "archivist"; stateVersion = homeStateVersion; }
			{ hostname = "apprentice"; stateVersion = homeStateVersion; }
		];

		# Function to make system configuration
		makeSystem = { hostname, stateVersion, ...}@inputs: nixpkgs.lib.nixosSystem {
			system = system;
			specialArgs = {
				inherit inputs stateVersion hostname user;
			};

			modules = [
				./hosts/${hostname}/configuration.nix
				home-manager.nixosModules.default
				stylix.nixosModules.stylix
				./modules
			];
		};
	in {
		nixosConfigurations = nixpkgs.lib.foldl'
		(configs: host:
			configs // {
				"${host.hostname}" = makeSystem {
					inherit (host) hostname stateVersion inputs;
				};
			}) {} hosts;

		# homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
		# 	pkgs = nixpkgs.legacyPackages.${system};
		# 	extraSpecialArgs = { inherit inputs homeStateVersion user; };
		# 	modules = [
		# 		inputs.stylix.homeModules.stylix
		# 		./home-manager/home.nix
		# 	];
		# };
	};
}
