{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
		# xdg-desktop-portal-gtk
		# discord
		# discord-canary
	];
}
