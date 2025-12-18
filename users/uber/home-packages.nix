{ pkgs, ... }:
{
	home.packages = with pkgs; [
		neovim
		ranger
	];
}
