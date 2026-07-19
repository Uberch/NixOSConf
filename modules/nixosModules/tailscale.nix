_: {
	flake.nixosModules.tailscale = { config, pkgs, ... }: {
		services.tailscale = {
			enable = true;
		};
		systemd.services.tailscale-autoconnect = {
			description = "Automatic connection to tailscale network";
			after = [ "tailscale.service" "network-online.target" ];
			wants = [ "tailscale.service" "network-online.target" ];
			wantedBy = [ "multi-user.target" ];

			serviceConfig = {
				Type = "oneshot";
				RemainAfterExit = true;
				EnvironmentFile = "/var/secrets/tailscale";
				ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";

				Restart = "on-failure";
				RestartSec = "10s";
				StartLimitIntervalSec = 0;
			};

			script = ''
				status=$(${config.services.tailscale.package}/bin/tailscale status --json | ${pkgs.jq}/bin/jq -r '.BackendState')
				if [ "$status" != "Running" ]; then
					${config.services.tailscale.package}/bin/tailscale up \
					--login-server http://$HEADSCALE_IP:$HEADSCALE_PORT \
					--authkey $HEADSCALE_KEY \
					--accept-dns=true
				fi
			'';
		};
	};
}
