{ config, ... }: {
	stylix = {
		enable = true;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
		image = ./bloodrock-steppes.png;
		polarity = "dark";
		targets.nixvim.enable = false;
	};
}
