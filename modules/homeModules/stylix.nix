{
	flake.homeModules.stylix = { pkgs, ... }: {
		home.file = {
			"images/guard.png".source = ../../images/guard.png;
			"images/back.png".source = ../../images/bloodrock-steppes.png;
		};
		home.pointerCursor.enable = true;
		stylix = {
			base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
			image = ../../images/bloodrock-steppes.png;
			polarity = "dark";
			targets = {
				nixvim.enable = false;
				waybar.enable = false;
			};
			cursor = {
				size = 24;
				package = pkgs.bibata-cursors;
				name = "Bibata-Modern-Ice";
			};
		};
	};
}
