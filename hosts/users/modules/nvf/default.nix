{ nvf, ... }: {
	programs.nvf.enable = true;
	imports = [
		nvf.homeManagerModules.default
		./keymaps.nix
		./lsp.nix
		./options.nix
	];
}
