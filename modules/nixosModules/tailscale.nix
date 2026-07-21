{ self, ... }: {
	flake.nixosModules = {
		sops-tailscale = { config, ... }: {
			imports = [ self.nixosModules.sops-base ];
			sops.templates = {
				"tailscale-env" = {
					path = "/run/secrets/tailscale-env";
					content = ''
						TS_LOGIN_SERVER="http://${config.sops.placeholder.vpnIp}:${config.sops.placeholder.headscalePort}"
					'';
				};
			};
		};
		tailscale = { config, ... }: {
			imports = [ self.nixosModules.sops-tailscale ];
			services.tailscale = {
				enable = true;
				openFirewall = true;
				authKeyFile = config.sops.secrets.headscaleKey.path;
				authKeyParameters ={
					preauthorized = true;
				};
			};
			systemd.services.tailscaled.serviceConfig.EnvironmentFile = [
				config.sops.templates."tailscale-env".path
			];
		};
	};
}
