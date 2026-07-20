{
	description = "Basic system configuration";

	inputs = {
		# Packages
		nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		# Architecture
		flake-parts.url = "github:hercules-ci/flake-parts";
		import-tree.url = "github:vic/import-tree";

		# Other
		home-manager.url = "github:nix-community/home-manager/release-26.05";
		stylix.url = "github:nix-community/stylix/release-26.05";
		disko.url = "github:nix-community/disko";
		sops-nix.url = "github:Mic92/sops-nix";

		# Neovim
		nixvim.url = "github:nix-community/nixvim/nixos-26.05";
		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "unstable";
		};
	};

	outputs = inputs:
		inputs.flake-parts.lib.mkFlake { inherit inputs; } {
			imports = with inputs; [
				disko.flakeModules.default
				home-manager.flakeModules.default
				(import-tree ./modules)
			];
			systems = [
				"x86_64-linux"
			];
			perSystem = { config, pkgs, system, ... }: {
				packages.iso = inputs.self.nixosConfigurations.iso.config.system.build.isoImage;
			};
		};
}
