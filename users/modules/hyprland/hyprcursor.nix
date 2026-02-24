{ config, lib, ... }: {
	config = lib.mkIf config.hyprland.enable {
		home.pointerCursor = {
			hyprcursor = {
				enable = true;
				size = 32;
			};
		};
	};
}
