{
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		../modules
		./modules.nix
	];

	home = let
		username = "avatar";
	in {
		inherit username;
		homeDirectory = "/home/${username}";
		stateVersion = "25.05";
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
