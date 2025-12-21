{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		go
		kanata
		hyprland
		firefox
	];
}
