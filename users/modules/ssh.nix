{ config, ... }: {
	programs.ssh = {
		enable = true;

		enableDefaultConfig = false;

		matchBlocks = let
			identityDir = "${config.home.homeDirectory}/.ssh/keys";
		in {
			"*" = {
				hashKnownHosts = true;		# Hash stored known hosts
				addKeysToAgent = "yes";		# Add key identities to key agent
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
}
