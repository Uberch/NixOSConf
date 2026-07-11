_: {
	flake.homeModules.kitty = {
		programs.kitty = {
			enable = true;
			settings = {
				clipboard_control = "write-clipboard write-primary read-clipboard read-primary";
			};
		};
	};
}
