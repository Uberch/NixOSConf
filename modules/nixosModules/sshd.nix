_: {
	flake.nixosModules.sshd = { pkgs, ... }: {
		environment.enableAllTerminfo = true;
		services.openssh = {
			enable = true;

			settings = {
				PermitRootLogin = "no";
				# Banner = pkgs.writeText "Who dare to disturb my place?!\n";
			};
		};
	};
}
