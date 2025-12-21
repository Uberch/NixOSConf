{ lib, ...}: {
	options.hyprland.enable =
		lib.mkEnableOption "Enables hyprland module for user";

	imports = [
		./cursor.nix
		./general.nix
		./input.nix
		./keymaps.nix
		./misc.nix
		./rofi.nix
	];
}
