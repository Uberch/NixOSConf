{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	wayland.windowManager.hyprland.settings.cursor = {
		hide_on_key_press = true;
	};
};
}
