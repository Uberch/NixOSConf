{ self, ... }: {
	flake.nixosModules.avatar = { config, ... }: {
		users.users.avatar = {
			hashedPasswordFile = config.sops.secrets.pswdhs_avatar.path;
			isNormalUser = true;
			description = "User for ssh connection";
			extraGroups = [
				"networkmanager"
				"wheel"
				"docker"
				"input"
			];
		};
		home-manager = {
			useGlobalPkgs = true;
			users.avatar = {
				imports = [ self.homeModules.avatar ];
			};
		};
	};

	flake.homeModules.avatar = {
		imports = with self.homeModules; [
			bash
			ranger
			stylix
			tmux
		];
		home = let
			username = "avatar";
		in {
			inherit username;
			stateVersion = "26.05";
			sessionVariables = {
				EDITOR = "nvim";
			};
		};
	};
}
