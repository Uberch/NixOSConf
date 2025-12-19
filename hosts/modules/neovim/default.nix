{ config, ... }: {
	# Import all your configuration modules here
	imports = [ 
		./keymaps.nix
		./options.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
	};
}
