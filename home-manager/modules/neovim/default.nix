{inputs, ...}:
{
	# Import all your configuration modules here
	imports = [ 
		inputs.nixvim.homeManagerModules.nixvim
		./keymaps.nix
		./options.nix
		./plugins.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
	};
}
