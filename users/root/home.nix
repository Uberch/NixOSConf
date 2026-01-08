{ stateVersion, ... }: {
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		./modules.nix
		../modules
	];

	home = {
		username = "root";
		stateVersion = stateVersion; # Please read the comment before changing.
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
