{ lib, ... }: {
	options = {
		lutris.enable =
			lib.mkEnableOption "Enable Lutris game launcher";

		hyprland = {
			enable =
				lib.mkEnableOption "Enables hyprland module for user";

			# autoEnter =
			# 	lib.mkEnableOption
			# 	"If user should enter hyprland automatically after login";

			# disableTouchpad =
			# 	lib.mkEnableOption
			# 	"Disables touchpad";

			inputMode = lib.mkOption {
				description = "Specific input configuration to choose";
				type = lib.types.enum [
					"work"
					"game"
				];
				default = "work";
			};
		};
	};
}
