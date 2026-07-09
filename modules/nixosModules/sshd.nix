_: {
	flake.nixosModules.sshd = {
		environment.enableAllTerminfo = true;
		services.openssh = {
			enable = true;

			banner = "Who dare to disturb my place?!\n";
			settings.PermitRootLogin = "no";
		};
	};
}
