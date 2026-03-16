{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		go
		kanata
		hyprland
		firefox
		bluez
	];
}
