{ lib, config, ... }: {
	config = lib.mkIf config.hyprland.enable {
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
				name = "vpn";
				"match:title" = "AmneziaVPN";
				workspace = 4;
				fullscreen = "on";
			}
			{
				name = "chilly_firefox";
				"match:tag" = "chill*";
				workspace = 2;
				fullscreen = "on";
			}
			{
				name = "main_firefox";
				"match:tag" = "browse*";
				workspace = 3;
				fullscreen = "on";
			}
		];
	};
}
