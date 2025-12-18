{ pkgs, ... }:
{
	home.packages = with pkgs; [
		tdesktop
		neovim
		ranger
	];
}
