{ config, username, stateVersion, ... }: {
	programs.home-manager.enable = true;

	imports = [
		./home-packages.nix
		./modules.nix
		../modules
	];

	home = let
		username = "uber";
	in {
		username = username;
		homeDirectory = "/home/${username}";
		stateVersion = stateVersion; # Please read the comment before changing.
	};
}
