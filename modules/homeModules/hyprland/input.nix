_: {
	flake.homeModules = {
		hyprlandInput = {lib, ...}: {
			wayland.windowManager.hyprland.settings = {
				input = {
					kb_layout = "us,ru";
					kb_variant = ",";
					kb_options = "grp:caps_toggle";
					numlock_by_default = false;
					resolve_binds_by_sym = false;
					sensitivity = 0;

					touchpad = {
						disable_while_typing = lib.mkDefault true;
						natural_scroll = "yes";
						clickfinger_behavior = false;
						scroll_factor = 1;
					};
				};
			};
		};

		hyprlandInputGame = {
			wayland.windowManager.hyprland.settings={
				input = {
					follow_mouse = 1;
					mouse_refocus = true;
					focus_on_close = 1;
					touchpad.disable_while_typing = false;
				};
				device = [
					{
						name = "elan260b:00-04f3:31dc-touchpad";
						enabled = false;
					}
				];
			};
		};

		hyprlandInputWork = {
			wayland.windowManager.hyprland.settings.input = {
				follow_mouse = 3;
				mouse_refocus = true;
				focus_on_close = 1;
			};
		};
	};
}
