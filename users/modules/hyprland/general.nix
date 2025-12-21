{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			general = {
				border_size = 3;
				gaps_in = 3;
				gaps_out = 7;
			};
			
			decoration.rounding = 5;

			ecosystem = {
				no_update_news = false;
				no_donation_nag = true;
			};

			monitor = [
				"eDP-1, preferred, 0x0, 1"
				"HDMI-A-1, preferred, 0x-1200, 1"
			];
		};
	};
};
}
