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

		# Hyprland
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, stylix, nixvim, hyprland, ... }@inputs: let
		# General variables
		system = "x86_64-linux";
		generalStateVersion = "25.05";
		newStateVersion = "25.11";
		hosts = [
			{ hostname = "archivist";	username = "avatar";	stateVersion = newStateVersion; }
			{ hostname = "apprentice";	username = "uber";	stateVersion = generalStateVersion; }
		];
		users = [
			{ username = "uber";		stateVersion = generalStateVersion; }
			{ username = "avatar";	stateVersion = newStateVersion; }
		];

		# Function to make system configuration
		makeSystem = { hostname, username, stateVersion }: nixpkgs.lib.nixosSystem {
			system = system;
			specialArgs = {
				inherit hostname username stateVersion;
			};

			modules = [
				./hosts
				nixvim.nixosModules.nixvim
				stylix.nixosModules.stylix
			];
		};

		# Function to make home manager configuration
		makeHome = { username, stateVersion }: home-manager.lib.homeManagerConfiguration {
			extraSpecialArgs = {
				inherit username stateVersion;
			};

			modules = [
				./users
				nixvim.homeModules.nixvim
				stylix.homeModules.stylix
			];

			pkgs = nixpkgs.legacyPackages.${system};
		};

	in {
		# Make nixos configurations
		nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
			configs // {
				"${host.hostname}" = makeSystem {
					inherit (host) hostname username stateVersion;
				};
			}) {} hosts;

		# Make home manager configurations
		homeConfigurations = nixpkgs.lib.foldl' (configs: user:
			configs // { 
				"${user.username}" = makeHome {
					inherit (user) username stateVersion;
				};
			}) {} users;
	};
}
