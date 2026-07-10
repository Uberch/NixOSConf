{
	description = "Basic system configuration";

	inputs = {
		# Packages
		nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
		unstable = {
			url = "github:nixos/nixpkgs/nixos-unstable";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Architecture
		flake-parts = {
			url = "github:hercules-ci/flake-parts";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		import-tree = {
			url = "github:vic/import-tree";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Other
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:nix-community/stylix/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Neovim
		nixvim = {
			url = "github:nix-community/nixvim/nixos-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs:
		inputs.flake-parts.lib.mkFlake { inherit inputs; } {
			imports = [
				inputs.home-manager.flakeModules.default
				(inputs.import-tree ./modules)
			];
			systems = [
				"x86_64-linux"
			];
		};
}
