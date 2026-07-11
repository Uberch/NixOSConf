{ self, ... }: {
	flake.nixosModules.avatar = {
		users.users.avatar = {
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
			users.uber = {
				imports = [ self.homeModules.avatar ];
			};
		};
	};

	flake.homeModules.avatar = {
		imports = with self.homeModules; [
			bash
			ranger
			ssh
			stylix
			tmux
		];
		programs.home-manager.enable = true;
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
