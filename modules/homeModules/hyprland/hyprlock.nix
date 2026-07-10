_: {
	flake.homeModules.hyprlandHyprlock = {lib, ...}: {
		programs.hyprlock = {
			enable = true;
			sourceFirst = true;
			settings = let
				lap_monitor = "eDP-1";
				shadow_general = {
					shadow_passes = 10;
					shadow_size = 20;
					# shadow_color = "$shadow";
					shadow_boost = 1.6;
				};
			in {
				general = {
					hide_cursor = true;
					ignore_empty_input = true;
					fail_timeout = 500;
				};

				background = {
					monitor = "";
					path = lib.mkForce "~/images/back.png";
					blur_passes = 2;
					blur_size = 1;
				};

				image = {
					monitor = lap_monitor;
					path = "~/images/guard.png";
					size = 280;
					rounding = 40;
					border_size = 4;
					border_color = "$primary";
					rotate = 0;
					reload_time = -1;
					position = "0, 200";
					halign = "center";
					valign = "center";
				};
				
				input-field = {
					monitor = lap_monitor;
					size = "200, 50";
					outline_thickness = 3;
					dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
					dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
					dots_center = true;
					dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
					# outer_color = lib.mkForce "$on_primary";
					# inner_color = lib.mkForce "$on_surface";
					# font_color = lib.mkForce "$surface";
					fade_on_empty = false;
					fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
					placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
					hide_input = false;
					rounding = 40; # -1 means complete rounding (circle/oval)
					# check_color = lib.mkForce "$primary";
					# fail_color = lib.mkForce "$error"; # if authentication failed, changes outer_color and fail message color
					fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
					fail_transition = 300; # transition time in ms between normal outer_color and fail_color
					capslock_color = -1;
					numlock_color = -1;
					bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
					invert_numlock = false; # change color if numlock is off
					swap_font_color = false;
					position = "0, -20";
					halign = "center";
					valign = "center";
				} // shadow_general;

				label = [
					{
						monitor = lap_monitor;
						text = "$LAYOUT";
						text_align = "center";
						color = "$on_surface";
						font_size = 20;
						font_family = "Fira Semibold";
						position = "-100, 60";
						halign = "right";
						valign = "bottom";
						shadow_passes = 5;
						shadow_size = 10;
					}
					{
						monitor = lap_monitor;
						text = "cmd[update:1000] echo \"$TIME\"";
						text_align = "center";
						color = "$on_surface";
						font_size = 20;
						font_family = "Fira Semibold";
						position = "-100, 120";
						halign = "right";
						valign = "bottom";
						shadow_passes = 5;
						shadow_size = 10;
					}
				];
			};

			extraConfig = ''
			'';
		};
	};
}
