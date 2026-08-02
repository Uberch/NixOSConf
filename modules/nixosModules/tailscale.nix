{ self, ... }: {
	flake.nixosModules = {
		sops-tailscale = { config, ... }: {
			imports = [ self.nixosModules.sops-base ];
			sops.templates = {
				"tailscale-env" = {
					path = "/run/secrets/tailscale-env";
					content = ''
						TS_LOGIN_SERVER="${config.sops.placeholder.vpnUrl}"
					'';
				};
			};
		};
		tailscale = { config, ... }: {
			imports = [ self.nixosModules.sops-tailscale ];
			networking.firewall = {
				enable = true;
				trustedInterfaces = [ "tailscale0" ];
				allowPing = true;
			};
			services.tailscale = {
				enable = true;
				openFirewall = true;
				authKeyFile = config.sops.secrets.headscaleKey.path;
				extraUpFlags = [
					"--accept-dns"
				];
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
