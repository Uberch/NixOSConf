{ self, ... }: {
	flake.nixosModules.root = { config, ... }: {
		users.users.root.hashedPasswordFile = config.sops.secrets.root_password_hash.path;
		home-manager = {
			useGlobalPkgs = true;
			users.root = {
				imports = [ self.homeModules.root ];
			};
		};
	};

	flake.homeModules.root = {
		imports = with self.homeModules; [
			ranger
			stylix
			tmux
		];
		home = let
			username = "root";
		in {
			inherit username;
			stateVersion = "26.05";
			sessionVariables = {
				EDITOR = "nvim";
			};
		};
	};
}
