{ lib, ...}: {
options = {
	hyprland.enable =
		lib.mkEnableOption "Enables hyprland module for user";
};
	imports = [
		./cursor.nix
		./drun.nix
		./general.nix
		./input.nix
		./keymaps.nix
		./misc.nix
	];
}
