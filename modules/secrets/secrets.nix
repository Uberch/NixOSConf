{ inputs, ... }: {
	flake.nixosModules.sops = { pkgs, config, ... }: {
		imports = [
			inputs.sops-nix.nixosModules.sops
		];
		environment.systemPackages = with pkgs; [
			sops age
		];
		sops = {
			defaultSopsFile = ./secrets.yaml;
			defaultSopsFormat = "yaml";
			
			age.keyFile = "/var/lib/sops-nix/key.txt";

			secrets = {
				vpnIp = {};
				headscalePort = {};
				headscaleKey = {};
			};
			templates = {
				"ssh-vps-config" = {
					owner = "uber"; 
					path = "/run/secrets/ssh-vps-config";
					
					# Пишем содержимое файла. sops автоматически подставит raw IP вместо placeholder
					content = ''
						Host vpn
							HostName ${config.sops.placeholder.vpnIp}
							User root
							IdentityFile ~/.ssh/keys/vpn/key
					'';
				};
				"tailscale-env" = {
					path = "/run/secrets/tailscale-env";
					content = ''
						TS_LOGIN_SERVER="http://${config.sops.placeholder.vpnIp}:${config.sops.placeholder.headscalePort}"
					'';
				};
			};
		};
	};
}
