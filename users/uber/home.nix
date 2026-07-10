{
	imports = [
		./home-packages.nix
		./modules.nix
		../modules
	];

	programs.home-manager.enable = true;
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
