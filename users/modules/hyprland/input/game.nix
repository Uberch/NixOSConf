{ lib, config, ... }: {
config = lib.mkIf (config.hyprland.enable && config.hyprland.inputMode == "game") {
	wayland.windowManager.hyprland.settings.input = {
		follow_mouse = 1;
		mouse_refocus = true;
		focus_on_close = 1;
		touchpad.disable_while_typing = false;
		device = [
			{
				name = "elan260b:00-04f3:31dc-touchpad";
				enabled = false;
			}
		];
	};
};
}
