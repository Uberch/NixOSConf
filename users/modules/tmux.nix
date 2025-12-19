{
	programs.tmux = {
		# Enable package conf
		enable = true;

		clock24 = true;								# 24-hours format of time
		keyMode = "vi";								# Use vi-style shortcuts
		customPaneNavigationAndResize = true;	# Override hjkl bindings for pane navigation and resizing
		mouse = true;
		# extraConfig = ''
		# 	split-window -h
		# 	select-pane -t 0
		# 	resize-pane -x 80
		# 	split-window -v
		# '';
	};
}
