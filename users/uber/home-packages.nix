{ pkgs, ... }: {
	home.packages = with pkgs; [
		telegram-desktop
		python3
		obsidian
	];
}
