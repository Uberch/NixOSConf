{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
		programs.hyprshot = {
			enable = true;
			saveLocation = "${config.home.homeDirectory}/screenshots";
		};
};
}
