{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		# discord
		go
		kanata
		hyprland
		firefox
		bluez
	];
}
