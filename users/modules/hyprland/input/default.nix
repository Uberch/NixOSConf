{ config, lib, ... }: {
config = lib.mkIf config.hyprland.enable {
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
	imports = [
		./work.nix
		./game.nix
	];
}
