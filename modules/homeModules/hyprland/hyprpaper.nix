_: {
	flake.homeModules.hyprlandHyprpaper = {
		services.hyprpaper = {
			enable = true;
			settings = {
				ipc = "on";
				splash = false;
				splash_offset = 20;
				splash_opacity = 0.8;

				preload = [
					"~/image/back.png"
				];

				wallpaper = [
					# "eDP-1,~/image/back.png"
					# "HDMI-A-1,~/image/back.png"
				];
			};
		};
	};
}
