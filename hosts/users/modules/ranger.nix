{
	programs.ranger = {
		# Enable package configuration
		enable = false;

		rifle = [
			{
				condition = "ext nix";
				command = "nvim -- $@";
			}
		];
	};
}
