{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		git
		openssh
		home-manager
		tmux
		zapret
		neovim
		ranger
	];
}
