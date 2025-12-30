{ config, username, stateVersion, ... }: {
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		../modules
		./modules.nix
	];

	home = let
		username = "joker";
	in {
		username = username;
		homeDirectory = "/home/${username}";
		stateVersion = stateVersion; # Please read the comment before changing.
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
