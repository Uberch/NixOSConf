{
	programs.ssh = {
		enable = true;

		enableDefaultConfig = false;

		matchBlocks = {
			gh = {
				user = "git";
				hostname = "github.com";
				identityFile = "/home/uber/.ssh/keys/gh/key";
				hashKnownHosts = true;		# Hash stored known hosts
				addKeysToAgent = "yes";		# Add key identities to key agent
			};
			ghiu = {
				user = "git";
				hostname = "github.com";
				identityFile = "/home/uber/.ssh/keys/ghiu/key";
				hashKnownHosts = true;		# Hash stored known hosts
				addKeysToAgent = "yes";		# Add key identities to key agent
			};
			gliu = {
				user = "git";
				hostname = "gitlab.pg.innopolis.university";
				identityFile = "/home/uber/.ssh/keys/gliu/key";
				hashKnownHosts = true;		# Hash stored known hosts
				addKeysToAgent = "yes";		# Add key identities to key agent
			};
		};
	};
}
