{
	description = "Basic system configuration";

	inputs = {
		# General package repo
		nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:vic/import-tree";

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
	};

	outputs = inputs:
		inputs.flake-parts.lib.mkFlake { inherit inputs; }
			(inputs.import-tree ./modules);
}
