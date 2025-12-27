{ lib, config, ... }: {
config = lib.mkIf config.sshd.enable {
	environment.enableAllTerminfo = true;
	services.openssh = {
		enable = true;

		banner = "Who dare to disturb my place?!";
		settings.PermitRootLogin = "no";
	};
};
}
