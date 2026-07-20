_: {
	flake.nixosModules.tailscale = { config, ... }: {
		services.tailscale = {
			enable = true;
			openFirewall = true;
			authKeyFile = config.sops.secrets.headscaleKey.path;
			authKeyParameters = let
				baseURL = "http://${config.sops.secrets.vpnIp.sopsFile}:${config.sops.secrets.headscalePort.sopsFile}";
			in {
				preauthorized = true;
				inherit baseURL;
			};
		};
		systemd.services.tailscaled.serviceConfig.EnvironmentFile = [
			config.sops.templates."tailscale-env".path
		];
	};
}
