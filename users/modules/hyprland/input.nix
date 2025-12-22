{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	wayland.windowManager.hyprland.settings = {
		input = {
			kb_layout = "us,ru";
			kb_variant = ",";
			kb_options = "grp:caps_toggle";
			numlock_by_default = false;
			resolve_binds_by_sym = false;
			sensitivity = 0;

			follow_mouse = 3;
			mouse_refocus = true;
			focus_on_close = 1;

			touchpad = {
				disable_while_typing = true;
				natural_scroll = "yes";
				clickfinger_behavior = false;
				scroll_factor = 1;
			};

		};
		device = lib.mkIf config.hyprland.disableTouchpad [
			{
				name = "elan260b:00-04f3:31dc-touchpad";
				enabled = false;
			}
		];
	};
};
}
