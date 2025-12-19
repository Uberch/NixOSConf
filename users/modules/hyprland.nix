{ lib, config, pkgs, ... }: {
options = {
	hyprland.enable =
		lib.mkEnableOption "Enables hyprland module for user";
};

config = lib.mkIf config.hyprland.enable {
	# let
	# 	startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
	# 		${pkgs.waybar}/bin/waybar &
	# 		${pkgs.swww}/bin/swww init &
	#
	# 		sleep 1
	#
	# 		${pkgs.swww}/bin/swww img ${./bloodrock-steppes.png} &
	# 	'';
	# in {
		home.packages = with pkgs; [
			kitty
		];

		wayland.windowManager.hyprland = {
			enable = true;
			settings = {
				"$mod" = "SUPER";
				"$ret" = "RETURN";
				"$sft" = "SHIFT";
				"$ctl" = "CTRL";

				input = {
					kb_layout = "us,ru";
					kb_variant = ",";
					kb_options = "grp:caps_toggle";
					numlock_by_default = false;
					mouse_refocus = true;
					resolve_binds_by_sym = false;

					follow_mouse = 1;
					touchpad = {
						natural_scroll = "yes";
						clickfinger_behavior = false;
						scroll_factor = 1;
					};
					sensitivity = 0;
				};

				bind = [
					# Worspace navigation
					"$mod, 1, workspace, 1"
					"$mod, 2, workspace, 2"
					"$mod, 3, workspace, 3"
					"$mod, 4, workspace, 4"
					"$mod, 5, workspace, 5"
					"$mod, 6, workspace, 6"
					"$mod, 7, workspace, 7"
					"$mod, 8, workspace, 8"
					"$mod, 9, workspace, 9"
					"$mod, 0, workspace, 0"
					"$mod, Tab, workspace, m+1"
					"$mod $sft, Tab, workspace, m-1"

					# Move window to workspace n
					"$mod $sft, 1, movetoworkspace, 1"
					"$mod $sft, 2, movetoworkspace, 2"
					"$mod $sft, 3, movetoworkspace, 3"
					"$mod $sft, 4, movetoworkspace, 4"
					"$mod $sft, 5, movetoworkspace, 5"
					"$mod $sft, 6, movetoworkspace, 6"
					"$mod $sft, 7, movetoworkspace, 7"
					"$mod $sft, 8, movetoworkspace, 8"
					"$mod $sft, 9, movetoworkspace, 9"
					"$mod $sft, 0, movetoworkspace, 0"

					# Focus movement
					"$mod, H, movefocus, l"
					"$mod, J, movefocus, d"
					"$mod, K, movefocus, u"
					"$mod, L, movefocus, r"

					# Applications
					"$mod, $ret, exec, kitty"
					"$mod, T, exec, Telegram"
					"$mod, B, exec, firefox"

					# Windows
					"$mod, Q, killactive"
					"$mod, F, fullscreen"
				];

				# exec-once = ''${startupScript}/bin/start'';
			};
		};
	# };
};
}
