{ lib, config, pkgs, ... }: {
	config = lib.mkIf config.hyprland.enable {
		wayland.windowManager.hyprland = {
			submaps = {
				# Submap for resizing and managing layout
				resize.settings = {
					binde = [
						", H, resizeactive, -100 0"
						", J, resizeactive, 0 100"
						", K, resizeactive, 0 -100"
						", L, resizeactive, 100 0"
						", S, swapsplit"
						", D, togglesplit"
						", B, exec, ~/.config/waybar/launch.sh"
					];
					bind = [
						", Q, submap, reset"
					];
				};
				# Submap for controlling media
				media.settings = {
					bind = [
						", K, exec, playerctl play-pause"

						", N, exec, playerctl next"
						", P, exec, playerctl previous"

						", S, exec, playerctl shuffle Toggle"

						", Q, submap, reset"
					];
				};
			};
			settings = {
				binds = {
					workspace_back_and_forth = true;
					workspace_center_on = 1;
					movefocus_cycles_fullscreen = true;
				};

				"$sup" = "SUPER";
				"$ret" = "RETURN";
				"$sft" = "SHIFT";
				"$ctl" = "CTRL";

				# Universal binds
				bindu = [
					"$sup, H, movefocus, l"
					"$sup, J, movefocus, d"
					"$sup, K, movefocus, u"
					"$sup, L, movefocus, r"
					"$sup, Q, killactive"
					"$sup, F, fullscreen"
				];

				bind = let
					mkMenu = menu: let
						configFile = builtins.toFile "config.yaml"
							(lib.generators.toYAML {} {
								inherit menu;
							});
						in pkgs.writeShellScriptBin "my-menu" ''
							exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
						'';
				in [
					# Worspace navigation
					"$sup, 1, workspace, 1"
					"$sup, 2, workspace, 2"
					"$sup, 3, workspace, 3"
					"$sup, 4, workspace, 4"
					"$sup, 5, workspace, 5"
					"$sup, 6, workspace, 6"
					"$sup, 7, workspace, 7"
					"$sup, 8, workspace, 8"
					"$sup, 9, workspace, 9"
					"$sup, 0, workspace, 10"
					"$sup, Tab, workspace, m+1"
					"$sup $sft, Tab, workspace, m-1"

					# Move window to workspace n
					"$sup $sft, 1, movetoworkspace, 1"
					"$sup $sft, 2, movetoworkspace, 2"
					"$sup $sft, 3, movetoworkspace, 3"
					"$sup $sft, 4, movetoworkspace, 4"
					"$sup $sft, 5, movetoworkspace, 5"
					"$sup $sft, 6, movetoworkspace, 6"
					"$sup $sft, 7, movetoworkspace, 7"
					"$sup $sft, 8, movetoworkspace, 8"
					"$sup $sft, 9, movetoworkspace, 9"
					"$sup $sft, 0, movetoworkspace, 10"

					# Applications
					"$sup, $ret, exec, kitty"
					("$sup, D, exec," + lib.getExe (mkMenu [
						{
							key = "f";
							desc = "Firefox";
							cmd = "firefox";
						}
						{
							key = "t";
							desc = "Telegram";
							cmd = "Telegram";
						}
						{
							key = "s";
							desc = "Search application";
							cmd = "rofi -show drun -replace -i";
						}
					]))
					"$sup $sft, S, exec, hyprshot -m region -z -s -o ${config.home.homeDirectory}/images -f screenshot.png"
					"$sup $sft, D, exec, hyprlock"
					"$sup $sft, W, exec, ~/.config/waybar/launch.sh"

					# Windows
					"$sup $sft $ctl, K, exit"

					# Submaps
					"$sup, R, submap, resize"
					"$sup, M, submap, media"
					
					# Fn keys
					", XF86MonBrightnessUp, exec, brightnessctl -q s +5%"
					", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
					", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
					", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
					", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
					", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"

					", code:238, exec, brightnessctl -d smc::kbd_backlight s +10"
					", code:237, exec, brightnessctl -d smc::kbd_backlight s 10-"
				];
			};
		};
	};
}
