{ lib, config, ... }: {
config = lib.mkIf (config.hyprland.enable && config.hyprland.inputMode == "work") {
	wayland.windowManager.hyprland.settings.input = {
		follow_mouse = 3;
		mouse_refocus = true;
		focus_on_close = 1;
	};
};
}
