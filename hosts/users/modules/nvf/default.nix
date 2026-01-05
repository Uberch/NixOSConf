{ nvf, ... }: {
	programs.nvf={
		enable = true;
		defaultEditor = true;
	};
	imports = [
		nvf.homeManagerModules.default
		./keymaps.nix
		./lsp.nix
		./options.nix
	];
}
