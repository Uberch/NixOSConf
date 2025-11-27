{ homeStateVersion, user, ... }:
{
	programs.home-manager.enable = true;

	imports = [
		./modules
		./home-packages.nix
	];

	home = {
		username = user;
		homeDirectory = "/home/${user}";
		stateVersion = homeStateVersion; # Please read the comment before changing.
		sessionVariables = {
			EDITOR = "nvim";
		};
	};
}
