_: {
	flake.homeModules.hyprlandWaybar = {
		home.file.".config/waybar/launch.sh" = {
			enable = true;
			executable = true;
			text = ''
				killall waybar
				pkill waybar
				sleep 0.5

				waybar
			'';
		};
		programs.waybar = {
			enable = true;
			settings = {
				mainBar = {
					layer = "top";
					position = "top";
					height = 50;
					output = [
						"eDP-1"
					];
					modules-left = [
						"clock"
						"network"
						"bluetooth"
					];
					modules-center = [
						"hyprland/workspaces"
					];
					modules-right = [
						"pulseaudio"
						"group/hardware"
						"hyprland/language"
						"battery"
					];

					# Module definitions
					# General
					"hyprland/workspaces" = {
						persistent-workspaces = {
							"*" = 10;
						};
					};
					"clock" = {
						"format" = "{:%H:%M %a %d.%m}";
						# "on-click" = "flatpak run com.ml4w.calendar",
						"timezone" = "";
						"tooltip" = false;
					};
					"keyboard-state" = {
						# device-path = "/dev/input/event7";
						numlock = true;
						capslock = true;
						format = "{name} {icon}";
						format-icons = {
							"locked" = " ";
							"unlocked" = " ";
						};
					};
					# Network
					"network" = {
						"format" = "{ifname}";
						"format-wifi" = "  {essid} ({signalStrength}%)";
						"format-ethernet" = "{ifname}";
						"format-disconnected" = "Disconnected";
						"tooltip-format" = "{ifname} via {gwaddri}";
						"tooltip-format-wifi" = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
						"tooltip-format-ethernet" = "{ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
						"tooltip-format-disconnected" = "Disconnected";
						"max-length" = 50;
						"on-click" = "nmtui";
					};
					"bluetooth" = {
						"format" = " {status}";
						"format-disabled" = "";
						"format-off" = "";
						"interval" = 30;
						"on-click" = "blueman-manager";
						"format-no-controller" = "";
					};
					# Hardware
					"group/hardware" = {
						orientation = "inherit";
						drawer = {
							"transition-duration" = 300;
							"children-class" = "not-memory";
							"transition-left-to-right" = false;
						};
						modules = [
							"disk"
							"cpu"
							"memory"
						];
					};
					"cpu" = {
						format = "C {usage}% |";
						# on-click = "~/.config/ml4w/settings/system-monitor.sh";
					};
					"memory" = {
						format = "M {}% |";
						# on-click = "~/.config/ml4w/settings/system-monitor.sh";
					};
					"disk" = {
						interval = 30;
						format = "D {percentage_used}% ";
						path = "/";
						# on-click = "~/.config/ml4w/settings/system-monitor.sh";
					};
					"hyprland/language" = {
						format = "Kbd {short}";
					};
					# Battery
					"battery" = {
						"states" = {
							"good" = 80;
							"warning" = 50;
							"critical" = 20;
						};
						format = "{icon} {capacity}%";
						format-charging = " {capacity}%";
						format-plugged = " {capacity}%";
						"format-icons" = [" " " " " " " " " "];
					};
					# Sound
					"pulseaudio" = {
						"format" = "{icon} {volume}%";
						"format-bluetooth" = " {icon}  {volume}%";
						"format-bluetooth-muted" = " {icon} {format_source}";
						"format-muted" = "mute";
						"format-source" = " {volume}%";
						"format-source-muted" = " ";
						"format-icons" = {
							"default" = ["" " " " "];
						};
						"on-click" = "pavucontrol";
					};
				};
			};
			style = let
					# @define-color backgrounddark #FFFFFF;
					# @define-color workspacesbackground1 @color8;
					# @define-color workspacesbackground2 #FFFFFF;
					# @define-color bordercolor @color8;
					# @define-color textcolor1 @color8;
					# @define-color textcolor2 #FFFFFF;
					# @define-color textcolor3 #FFFFFF;
					# @define-color iconcolor #FFFFFF;
				colors = ''
					@define-color backgroundlight @color8;

					@define-color blur_background rgba(26, 17, 17, 0.3);
					@define-color blur_background8 rgba(26, 17, 17, 0.8);
					@define-color background #1a1111;
					@define-color error #ffb4ab;
					@define-color error_container #93000a;
					@define-color inverse_on_surface #382e2e;
					@define-color inverse_primary #8f4a4d;
					@define-color inverse_surface #f0dede;
					@define-color on_background #f0dede;
					@define-color on_error #690005;
					@define-color on_error_container #ffdad6;
					@define-color on_primary #561d22;
					@define-color on_primary_container #ffdada;
					@define-color on_primary_fixed #3b080e;
					@define-color on_primary_fixed_variant #733337;
					@define-color on_secondary #44292a;
					@define-color on_secondary_container #ffdada;
					@define-color on_secondary_fixed #2c1516;
					@define-color on_secondary_fixed_variant #5d3f40;
					@define-color on_surface #f0dede;
					@define-color on_surface_variant #d7c1c1;
					@define-color on_tertiary #422c05;
					@define-color on_tertiary_container #ffddb0;
					@define-color on_tertiary_fixed #281800;
					@define-color on_tertiary_fixed_variant #5b421a;
					@define-color outline #9f8c8c;
					@define-color outline_variant #524343;
					@define-color primary #ffb3b4;
					@define-color primary_container #733337;
					@define-color primary_fixed #ffdada;
					@define-color primary_fixed_dim #ffb3b4;
					@define-color scrim #000000;
					@define-color secondary #e6bdbd;
					@define-color secondary_container #5d3f40;
					@define-color secondary_fixed #ffdada;
					@define-color secondary_fixed_dim #e6bdbd;
					@define-color shadow #000000;
					@define-color source_color #dd5661;
					@define-color surface #1a1111;
					@define-color surface_bright #413737;
					@define-color surface_container #271d1d;
					@define-color surface_container_high #322828;
					@define-color surface_container_highest #3d3232;
					@define-color surface_container_low #221919;
					@define-color surface_container_lowest #140c0c;
					@define-color surface_dim #1a1111;
					@define-color surface_tint #ffb3b4;
					@define-color surface_variant #524343;
					@define-color tertiary #e6c18d;
					@define-color tertiary_container #5b421a;
					@define-color tertiary_fixed #ffddb0;
					@define-color tertiary_fixed_dim #e6c18d;
				'';
				general = ''
					* {
						font-family: "Fira Sans Semibold", "Font Awesome 6 Free", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
						font-size: 14px;
						border: none;
						border-radius: 0px;
						font-style: normal;
					}

					.modules-left {
						padding-left:14px;
					}

					.modules-left > widget:first-child > #workspaces {
						margin-left: 0;
					}

					.modules-right > widget:last-child > #workspaces {
						margin-right: 0;
					}

					#clock {
						color:@iconcolor;
					}
				'';
				workspaces = ''
					#workspaces {
						background: @workspacesbackground1;
						margin: 5px 1px 6px 1px;
						padding: 0px 1px;
						border-radius: 15px;
						border: 0px;
						font-weight: bold;
						font-style: normal;
						opacity: 0.8;
						font-size: 16px;
						color: @textcolor1;
					}

					#workspaces button {
						padding: 0px 5px;
						margin: 4px 3px;
						border-radius: 15px;
						border: 0px;
						color: @textcolor1;
						background-color: @workspacesbackground2;
						transition: all 0.3s ease-in-out;
						opacity: 0.4;
					}

					#workspaces button.active {
						color: @textcolor1;
						background: @workspacesbackground2;
						border-radius: 15px;
						min-width: 40px;
						transition: all 0.3s ease-in-out;
						opacity:1.0;
					}

					#workspaces button:hover {
						color: @textcolor1;
						background: @workspacesbackground2;
						border-radius: 15px;
						opacity:0.7;
					}
				'';
				hardware = ''
					#hardware {
					}

					#disk,#memory,#cpu,#language {
						margin:3px;
						padding:0px;
						color:@iconcolor;
					}

					#language {
						margin:10px;
					}

					#battery {
						background-color: @backgroundlight;
						color:@iconcolor;
						border-radius: 15px;
						padding: 2px 15px 0px 10px;
						margin: 8px 15px 8px 0px;
						opacity:0.8;
					}

					#battery.charging, #battery.plugged {
						color:@iconcolor;
						background-color: @backgroundlight;
					}

					#battery.critical:not(.charging) {
						background-color: #f53c3c;
						color:@iconcolor;
						animation-name: blink;
						animation-duration: 0.5s;
						animation-timing-function: linear;
						animation-iteration-count: infinite;
						animation-direction: alternate;
					}
				'';
				network = ''
					#network {
						background-color: @backgroundlight;
						color:@iconcolor;
						border-radius: 15px;
						padding: 2px 10px 0px 10px;
						margin: 8px 15px 8px 0px;
						opacity:0.8;
					}

					#network.ethernet {
						background-color: @backgroundlight;
						color:@iconcolor;
					}

					#network.wifi {
						background-color: @backgroundlight;
						color:@iconcolor;
					}
					
					#bluetooth, #bluetooth.on, #bluetooth.connected {
						background-color: @backgroundlight;
						color:@iconcolor;
						border-radius: 15px;
						padding: 2px 10px 0px 10px;
						margin: 8px 15px 8px 0px;
						opacity:0.8;
					}

					#bluetooth.off {
						background-color: transparent;
						padding: 0px;
						margin: 0px;
					}
				'';
			in colors + general + workspaces + hardware + network + ''
				window#waybar {
					background-color: @blur_background;
					border-bottom: 0px solid #ffffff;
					/* color: #FFFFFF; */
					transition-property: background-color;
					transition-duration: .5s;
				}
				
				tooltip {
					border-radius: 16px;
					background-color: @background;
					opacity:0.9;
					padding:30px;
					margin:0px;
				}

				tooltip label {
					color: @textcolor2;
				}
				
				#window {
					background: @backgroundlight;
					margin: 8px 15px 8px 0px;
					padding: 2px 10px 0px 10px;
					border-radius: 12px;
					color:@textcolor2;
					font-weight:normal;
					opacity:0.8;
				}

				window#waybar.empty #window {
					background-color:transparent;
				}

				#taskbar {
					background: @backgroundlight;
					margin: 6px 15px 6px 0px;
					padding:0px;
					border-radius: 15px;
					font-weight: normal;
					font-style: normal;
					opacity:0.8;
					border: 3px solid @backgroundlight;
				}

				#taskbar button {
					margin:0;
					border-radius: 15px;
					padding: 0px 5px 0px 5px;
				}

				#taskbar.empty {
					background:transparent;
					border:0;
					padding:0;
					margin:0;
				}

				@keyframes blink {
					to {
						background-color: @backgroundlight;
						color: @textcolor2;
					}
				}
			'';
		};
	};
}
