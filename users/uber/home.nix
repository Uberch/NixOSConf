{
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		./modules.nix
		../modules
	];

	home = let
		username = "uber";
	in {
		inherit username;
		stateVersion = "25.05";
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
