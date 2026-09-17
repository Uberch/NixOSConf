{ self, ... }: {
	flake.nixosModules = {
		sops-ghr = { config, ... }: {
			imports = [ self.nixosModules.sops-base ];
			sops.templates = {
				"ghr-token" = {
					path = "/run/secrets/runner-token";
					content = config.sops.placeholder.runnerToken;
				};
			};
		};
		githubRunner = { config, ... }: {
			imports = [ self.nixosModules.sops-ghr ];
			networking.enableIPv6 = false;
			systemd.services.github-runner-draft-helper = {
				after = [ "network-online.target" ];
				wants = [ "network-online.target" ];
			};
			services.github-runners.draft-helper = {
				enable = true;
				name = "selfhost";
				tokenType = "registration";
				tokenFile = config.sops.templates."ghr-token".path;
				url = "https://github.com/DonPerenon/Draft-Helper";
				nodeRuntimes = [
					"node24"
				];
			};
		};
	};
}
