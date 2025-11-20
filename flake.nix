{

	description = "Basic system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {nixpkgs, ...}@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				./hosts/default/configuration.nix
				inputs.home-manager.nixosModules.default
			];
		};
	};

}
