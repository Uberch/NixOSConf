{
	programs.ssh = {
		enable = true;

		addKeysToAgent = "yes";		# Add key identities to key agent
		hashKnownHosts = true;		# Hash stored known hosts
		matchBlocks = {
			gh = {
				user = "git";
				hostname = "github.com";
				identityFile = "/home/uber/.ssh/keys/gh/key";
			};
			ghiu = {
				user = "git";
				hostname = "github.com";
				identityFile = "/home/uber/.ssh/keys/ghiu/key";
			};
			gliu = {
				user = "git";
				hostname = "gitlab.pg.innopolis.university";
				identityFile = "/home/uber/.ssh/keys/gliu/key";
			};
		};
	};
}
