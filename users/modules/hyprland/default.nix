{ lib, ...}: {
	options.hyprland = {
		enable =
			lib.mkEnableOption "Enables hyprland module for user";
		autoEnter = 
			lib.mkEnableOption
			"If user should enter hyprland automatically after login";
		disableTouchpad =
			lib.mkEnableOption
			"Disables touchpad";
	};

	imports = [
		./cursor.nix
		./general.nix
		./input.nix
		./keymaps.nix
		./misc.nix
		./rofi.nix
	];
}
