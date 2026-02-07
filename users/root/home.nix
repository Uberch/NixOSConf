{
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		./modules.nix
		../modules
	];

	home = {
		username = "root";
		stateVersion = "25.05";
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
