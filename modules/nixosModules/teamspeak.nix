_: {
	flake.nixosModules.teamspeak = {
		services.teamspeak3 = {
			enable = true;
			openFirewall = true;
		};
	};
}
