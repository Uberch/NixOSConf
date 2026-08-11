{ self, inputs, ... }: {
	flake.homeModules.hyprland = { pkgs, ... }: {
		imports = with self.homeModules; [
			hyprlandHyprlock
			hyprlandHyprpaper
			hyprlandHyprshot
			hyprlandInput
			hyprlandKeymaps
			hyprlandMisc
			hyprlandRofi
			hyprlandWaybar
			hyprlandWindowrules
		];
		home.packages = with pkgs; [
			# Nerd Fonts (Recommended for icons/terminals)
			nerd-fonts.fira-code
			nerd-fonts.droid-sans-mono
			nerd-fonts.hack
			
			# Standard fonts
			noto-fonts
			noto-fonts-color-emoji
			font-awesome

			pavucontrol
			brightnessctl
			playerctl
			
			thunderbird
		];
		fonts.fontconfig.enable = true;

		programs.bash.bashrcExtra = ''
			set -o vi
			clear
			if [ "$(tty)" = "/dev/tty1" ]; then
				exec start-hyprland
			fi
		'';

		services = {
			batsignal = {
				enable = true;
				extraArgs = [
					"-p"
					"-f 80"
					"-F 'Hare kachat'"
					"-w 20"
					"-W 'Smotri'"
					"-c 10"
					"-C 'Alo Danya'"
					"-d 5"
					"-D 'DEBECH'"
					"-m 60"
				];
			};
			mako = {
				enable = true;
				settings = {
					layer = "overlay";
					"default-timeout" = 5000;
					"ignore-timeout" = 1;
				};
			};
		};

		wayland.windowManager.hyprland = {
			enable = true;
			package = inputs.unstable.outputs.legacyPackages."x86_64-linux".hyprland;
			configType = "hyprlang";
			systemd.enable = true;
			settings = {
				exec-once = [
					"hyprlock -q --immediate-render"
					"Telegram"
					"firefox"
					"kitty"
					"thunderbird"
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
