{ pkgs, ... }: {
	programs.tmux = let
		deskLayout = "43b5,192x62,0,0{65x62,0,0,3,126x62,66,0[126x41,66,0,4,126x20,66,42,5]}";
		lapLayout = "e442,192x62,0,0{106x62,0,0,10,85x62,107,0[85x31,107,0,11,85x30,107,32,12]}";
	in {
		# Enable package conf
		enable = true;

		prefix = "C-a";								# For further decision

		baseIndex = 1;

		clock24 = true;								# 24-hours format of time
		keyMode = "vi";								# Use vi-style shortcuts
		customPaneNavigationAndResize = true;	# Override hjkl bindings for pane navigation and resizing

		escapeTime = 300;
		mouse = true;
		historyLimit = 10000;

		plugins = with pkgs; [
			{
				plugin = tmuxPlugins.resurrect;
				extraConfig = "set -g @resurrect-strategy-nvim 'session'";
			}
			{
				plugin = tmuxPlugins.continuum;
				extraConfig = ''
					set -g @continuum-restore 'on'
					set -g @continuum-save-interval '10' # minutes
				'';
			}
		];

		extraConfig = ''
			bind f resize-pane -Z

			bind S select-layout "${lapLayout}"
			bind G select-layout "${deskLayout}"

			set -g repeat-time 1000;
			set -g renumber-windows on

			set -g pane-border-lines simple

			set -g status-left ""

			set -g window-status-format "*"
			set -g window-status-current-format "*"

			set -g window-status-current-style \
				"#{?window_zoomed_flag,fg=yellow,fg=magenta,nobold}"

			set -g  window-status-bell-style "fg=red,nobold"
		'';
	};
}
