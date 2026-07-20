_: {
	flake.nixosModules.tailscale = { config, pkgs, ... }: {
		services.tailscale = {
			enable = true;
			openFirewall = true;
			authKeyFile = "/var/secrets/tailscale/key";
			authKeyParameters = {
				preauthorized = true;
			};
		};
		systemd.services.tailscaled.serviceConfig.EnvironmentFile = "/var/secrets/tailscale/url";
		systemd.services.tailscale-autoconnect = {
			description = "Automatic connection to tailscale network";
			after = [ "tailscale.service" "network-online.target" ];
			wants = [ "tailscale.service" "network-online.target" ];
			wantedBy = [ "multi-user.target" ];

			serviceConfig = {
				EnvironmentFile = "/var/secrets/tailscale/url";
				# Type = "oneshot";
				# RemainAfterExit = true;
				# ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
				#
				# Restart = "on-failure";
				# RestartSec = "10s";
				# StartLimitIntervalSec = 0;
			};

			script = ''
				sleep 2
				${pkgs.tailscale}/bin/tailscale up \
					--auth-key "$(cat /var/secrets/tailscale/key)?preauthorized=true" \
					--login-server="$HEADSCALE_URL"
			'';
		};
	};
}
