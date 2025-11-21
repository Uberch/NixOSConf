{ pkgs, ... }:
{
	home.packages = with pkgs; [
		tmux
		neovim
		ranger
	];
}
