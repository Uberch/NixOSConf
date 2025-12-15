{ config, ... }: {
options = {
	neovim.enable =
		lib.mkEnableOption "Enables neovim configuration";
};

config = lib.mkIf config.neovim.enable {
	# Import all your configuration modules here
	imports = [ 
		./keymaps.nix
		./options.nix
		./plugins.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
	};
};
}
