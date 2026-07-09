_: {
	flake.nixosModules.virtualisation = {
		virtualisation.docker.enable = true;
		virtualisation.virtualbox.host.enable = true;
	};
}
