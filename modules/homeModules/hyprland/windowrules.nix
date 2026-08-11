_: {
	flake.homeModules.hyprlandWindowrules = {
		wayland.windowManager.hyprland.settings.windowrule = [
			{
				name = "telegram";
				"match:class" = "org.telegram.desktop";
				workspace = 1;
				fullscreen = "off";
			}
			{
				name = "firefox";
				"match:class" = "firefox";
				workspace = 2;
				fullscreen = "off";
			}
			{
				name = "terminal";
				"match:class" = "kitty";
				workspace = 7;
				fullscreen = "on";
			}
			{
				name = "thunderbird";
				"match:class" = "thunderbird";
				workspace = 4;
				fullscreen = "on";
			}
		];
	};
}
