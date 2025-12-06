{ config, ... }: {
	stylix = {
		enable = true;
		image = ./bloodrock-steppes.png;
		polarity = "dark";
		targets.nixvim.enable = false;
	};
}
