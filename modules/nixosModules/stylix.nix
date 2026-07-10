{ inputs, ... }: {
	flake.nixosModules.stylix = { pkgs, ... }: {
		imports = [
			inputs.stylix.nixosModules.default
		];
		stylix = {
			enable = true;
			base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
			homeManagerIntegration = {
				autoImport = true;
				followSystem = true;
			};
		};
	};
}
