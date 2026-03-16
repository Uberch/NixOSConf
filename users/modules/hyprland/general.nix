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
					"eDP-1, preferred, 0x0, 1"
					"HDMI-A-1, preferred, 0x-1080, 1"
				];

				workspace = [
					"1, monitor:eDP-1, default:true"
					"2, monitor:eDP-1"
					"3, monitor:eDP-1"
					"4, monitor:eDP-1"
					"5, monitor:eDP-1"
					"6, monitor:HDMI-A-1"
					"7, monitor:HDMI-A-1, default:true"
					"8, monitor:HDMI-A-1"
					"9, monitor:HDMI-A-1"
					"10, monitor:HDMI-A-1"
				];
			};
		};
	};
}
