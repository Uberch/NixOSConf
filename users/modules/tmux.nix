{ pkgs, ... }: {
	programs.tmux = {
		# Enable package conf
		enable = true;

		prefix = "C-b";								# For further decision

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
					set -g @continuum-save-interval '60' # minutes
				'';
			}
		];

		extraConfig = ''
			bind f resize-pane -Z
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
		# 	split-window -h
		# 	select-pane -t 0
		# 	resize-pane -x 80
		# 	split-window -v
	};
}
