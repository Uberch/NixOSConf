{ pkgs, ... }: {
	config = {
		home.file."images/back.png".source = ../../images/bloodrock-steppes.png;
		stylix = {
			enable = true;
			base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
			image = ../../images/bloodrock-steppes.png;
			polarity = "dark";
			targets.nixvim.enable = false;
		};
	};
}
