_: {
	flake.nixosModules.tailscale = {
		services.tailscale = {
			enable = true;
			authKeyFile = "/run/secrets/tailscale_key";
		};
	};
}
