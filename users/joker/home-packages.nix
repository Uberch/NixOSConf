{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		satisfactorymodmanager
		# xdg-desktop-portal-gtk
		# discord
		# discord-canary
	];
}
