_: {
	flake.homeModules.ssh = { osConfig, ... }: {
		programs.ssh = {
			enable = true;

			enableDefaultConfig = false;
			includes = [
				osConfig.sops.templates."ssh-vps-config".path
			];
			settings = let
				identityDir = "~/.ssh/keys";
			in {
				"*" = {
					hashKnownHosts = true;		# Hash stored known hosts
					addKeysToAgent = "yes";		# Add key identities to key agent
				};
				archive = {
					user = "avatar";
					hostname = "archive";
					identityFile = "${identityDir}/archive/key";
				};
				gh = {
					user = "git";
					hostname = "github.com";
					identityFile = "${identityDir}/gh/key";
				};
				ghiu = {
					user = "git";
					hostname = "github.com";
					identityFile = "${identityDir}/ghiu/key";
				};
				gliu = {
					user = "git";
					hostname = "gitlab.pg.innopolis.university";
					identityFile = "${identityDir}/gliu/key";
				};
			};
		};
	};
}
