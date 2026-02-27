{ lib, config, unstablePkgs, pkgs, ... }: {
	config = lib.mkIf config.hyprland.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			package = unstablePkgs.hyprland;
			settings = {
				exec-once = [
					"~/.config/waybar/launch.sh"
					"Telegram"
					"firefox"
					"kitty"
				];

				general = {
					border_size = 3;
					gaps_in = 3;
					gaps_out = 7;
				};
				
				decoration.rounding = 5;

				ecosystem = {
					no_update_news = true;
					no_donation_nag = true;
				};

				monitor = [
					"eDP-1, 1920x1200, 0x0, 1"
					"HDMI-A-1, preferred, 0x-1080, 1"
				];

				workspace = [
					"r[1-5], monitor:eDP-1, persistent"
					"r[6-10], monitor:HDMI-A-1, persistent"
					"1, monitor:eDP-1, default:true"
					"7, monitor:HDMI-A-1, default:true"
				];
			};
		};
	};
}
