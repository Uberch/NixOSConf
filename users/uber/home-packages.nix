{ pkgs, ... }: {
	home.packages = with pkgs; [
		just
		telegram-desktop
		python3
		obsidian
	];
}
