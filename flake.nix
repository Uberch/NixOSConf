{

	description = "Basic system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {nixpkgs, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			extraSpecialArguments = {inherit inputs;};
			modules = [
				./hosts/default/configuration.nix
				inputs.homa-manager.nixosModules.default
			];
		};
	};

}
