{
	description = "Basic system configuration";

	inputs = {
		# Packages
		nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		# Repo structure
		flake-parts = {
			url = "github:hercules-ci/flake-parts";
			inputs.nixpkgs-lib.follows = "nixpkgs";
		};
		import-tree.url = "github:vic/import-tree";

		# Neovim
		nixvim.url = "github:nix-community/nixvim/nixos-26.05";
		nvf = {
			url = "github:notashelf/nvf";
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
		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-minecraft = {
			url = "github:Infinidoge/nix-minecraft";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		llauncher.url = "github:Uberch/LegacyLauncherNixpkg";
	};

	outputs = inputs:
		inputs.flake-parts.lib.mkFlake { inherit inputs; } {
			systems = [
				"x86_64-linux"
			];
			imports = with inputs; [
				disko.flakeModules.default
				home-manager.flakeModules.default
				(import-tree ./modules)
			];
			perSystem = _: {
				packages.iso = inputs.self.nixosConfigurations.iso.config.system.build.isoImage;
			};
		};
}
