{
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		../modules
		./modules.nix
	];

	home = let
		username = "joker";
	in {
		inherit username;
		homeDirectory = "/home/${username}";
		stateVersion = "25.05"; # Please read the comment before changing.
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
