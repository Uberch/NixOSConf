{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	programs.rofi = {
		enable = true;
		font = lib.mkForce "Fira Sans 11";
		extraConfig = {
			modi = "drun,filebrowser,window,run";
			show-icons = true;
			icon-theme = "kora";
			display-drun = "d";
			display-run = "r";
			display-filebrowser = "f";
			display-window = "w";
			drun-display-format = "{name}";
			hover-select = false;
			scroll-method = 1;
			me-select-entry = "";
			me-accept-entry = "MousePrimary";
			window-format = "{w} · {c} · {t}";
		};
		theme = let
			inherit (config.lib.formats.rasi) mkLiteral;
		in {
			"*" = {
				border-size = mkLiteral "3px";
				border-radius = mkLiteral "2em";
			};

			# Main
			window = {
				height = mkLiteral "35em";
				width = mkLiteral "56em";
				fullscrean = false;
				enabled = true;
			};

			mainbox = {
				enabled = true;
				spacing = mkLiteral "0em";
				padding = mkLiteral "0em";
				orientation = mkLiteral "vertical";
				children = [
					"inputbar"
					"listbox"
				];
			};

			# Inputs
			inputbar = {
				enabled = true;
				spacing = mkLiteral "0em";
				padding = mkLiteral "5em";
				children = [
					"entry"
				];
			};
				
			textbox-prompt-colon = {
				enabled = true;
				expand = false;
				str = "  ";
				padding = mkLiteral "1em 0.2em 0em 0em";
				border-radius = mkLiteral "2em 0em 0em 2em";
			};

			entry = {
				enabled = true;
				border-radius = mkLiteral "0em 2em 2em 0em";
				spacing = mkLiteral "1em";
				padding = mkLiteral "1em";
				cursor = mkLiteral "text";
				placeholder = "Search";
			};

			# Lists
			listbox = {
				padding = mkLiteral "0em";
				spacing = mkLiteral "0em";
				orientation = mkLiteral "horizontal";
				children = [
					"listview"
					"mode-switcher"
				];
			};

			listview = {
				padding = mkLiteral "1.5em";
				spacing = mkLiteral "0.5em";
				enabled = true;
				columns = 2;
				lines = 3;
				cycle = true;
				dynamic = true;
				scrollbar = false;
				layout = mkLiteral "vertical";
				reverse = false;
				fixed-height = true;
				fixed-columns = true;
				cursor = mkLiteral "default";
			};

			# Modes
			mode-switcher = {
				orientation = mkLiteral "vertical";
				width = mkLiteral "6.6em";
				enabled = true;
				padding = mkLiteral "1.5em";
				spacing = mkLiteral "1.5em";
			};

			button = {
				cursor = mkLiteral "pointer";
				border-radius = mkLiteral "2em";
			};

			# Elements
			element = {
				enabled = true;
				spacing = mkLiteral "0em";
				padding = mkLiteral "0.5em";
				cursor = mkLiteral "pointer";
			};

			element-icon = {
				size = mkLiteral "3em";
				border-radius = mkLiteral "0em";
			};

			element-text = {
				vertical-align = mkLiteral "0.5";
				horizontal-align = mkLiteral "0.1";
			};

			# Error messages
			error-message = {
				text-transform = mkLiteral "capitalize";
				children = [
					"textbox"
				];
			};

			textbox = {
				vertical-align = mkLiteral "0.5";
				horizontal-align = mkLiteral "0.5";
			};
		};
	};
};
}
