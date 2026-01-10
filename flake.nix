{
	description = "Basic system configuration";

	inputs = {
		# General package repo
		nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
		
		# unstablePkgs = {
		# 	url = "github:nixos/nixpkgs/unstable";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };

		# Home-manager
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Stylix
		stylix = {
			url = "github:nix-community/stylix/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Nixvim for system-wide general-purpose file editing
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# NVF especially for development
		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Hyprland
		# hyprland = {
		# 	url = "github:hyprwm/Hyprland";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
	};

	outputs = {
			nixpkgs,
			home-manager,
			stylix,
			nixvim,
			nvf,
			...
			}: let
		# General variables
		system = "x86_64-linux";
		generalStateVersion = "25.05";
		newStateVersion = "25.11";
		hosts = [
			{ hostname = "archivist";	stateVersion = newStateVersion;
				users = [ "avatar" ]; }
			{ hostname = "apprentice"; stateVersion = generalStateVersion;
				users = [ "uber" "joker" ]; }
			{ hostname = "iso";			stateVersion = newStateVersion;
				users = []; }
		];

		# Function to make system configuration
		makeSystem = { hostname, stateVersion, users }: nixpkgs.lib.nixosSystem {
			system = system;
			specialArgs = {
				inherit hostname users stateVersion nvf;
			};

			modules = [
				./hardware-configuration.nix
				./hosts
				./users
				home-manager.nixosModules.default
				nixvim.nixosModules.nixvim
				stylix.nixosModules.stylix
			];
		};
	in {
		# Make nixos configurations
		nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
			configs // {
				"${host.hostname}" = makeSystem {
					inherit (host) hostname stateVersion users;
				};
			}) {} hosts;
	};
}
