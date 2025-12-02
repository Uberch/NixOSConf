{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		git
		openssh
		home-manager
		tmux
		kanata
	];
}
