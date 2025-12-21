{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	programs.rofi = {
		enable = true;
		theme = {
			"*" = {
				border-size = "3px";
				border-radius = "2em";
			};

			configuration = {
				modi = "drun,filebrowser,window,run";
				font = "Fira Sans 14";
				show-icons = true;
				icon-theme = "kora";
				display-drun = " ";
				display-run = " ";
				display-filebrowser = "  ";
				display-window = "  ";
				drun-display-format = "{name}";
				hover-select = false;
				scroll-method = 1;
				me-select-entry = "";
				me-accept-entry = "MousePrimary";
				window-format = "{w} · {c} · {t}";
			};

			# Main
			window = {
				height = "35em";
				width = "56em";
				fullscrean = false;
				enabled = true;
			};

			mainbox = {
				enabled = true;
				spacing = "0em";
				padding = "0em";
				orientation = "vertical";
				children = [
					"inputbar"
					"listbox"
				];
			};

			# Inputs
			inputbar = {
				enabled = true;
				spacing = "0em";
				padding = "5em";
				children = [
					"textbox-promt-colon"
					"entry"
				];
			};
				
			textbox-prompt-colon = {
				enabled = true;
				expand = false;
				str = "  ";
				padding = "1em 0.2em 0em 0em";
				border-radius = "2em 0em 0em 2em";
			};

			entry = {
				enabled = true;
				border-radius = "0em 2em 2em 0em";
				spacing = "1em";
				padding = "1em";
				cursor = "text";
				placeholder = "Search";
			};

			# Lists
			listbox = {
				padding = "0em";
				spacing = "0em";
				orientation = "horizontal";
				children = [
					"listview"
					"mode-switcher"
				];
			};

			listview = {
				padding = "1.5em";
				spacing = "0.5em";
				enabled = true;
				columns = 2;
				lines = 3;
				cycle = true;
				dynamic = true;
				scrollbar = false;
				layout = "vertical";
				reverse = false;
				fixed-height = true;
				fixed-columns = true;
				cursor = "default";
			};

			# Modes
			mode-switcher = {
				orientation = "vertical";
				width = "6.6em";
				enabled = true;
				padding = "1.5em";
				spacing = "1.5em";
			};

			button = {
				cursor = "pointer";
				border-radius = "2em";
			};

			# Elements
			element = {
				enabled = true;
				spacing = "0em";
				padding = "0.5em";
				cursor = "pointer";
			};

			element-icon = {
				size = "3em";
				border-radius = "0em";
			};

			element-text = {
				vertical-align = "0.5";
				horizontal-align = "0.1";
			};

			# Error messages
			error-message = {
				text-transform = "capitalize";
				children = [
					"textbox"
				];
			};

			textbox = {
				vertical-align = "0.5";
				horizontal-align = "0.5";
			};
		};
	};
};
}
