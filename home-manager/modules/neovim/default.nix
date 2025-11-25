{inputs, ...}:
{
	# Import all your configuration modules here
	imports = [ 
		inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./keymaps.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
	};
}
