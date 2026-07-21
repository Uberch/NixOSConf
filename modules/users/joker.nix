{ self, ... }: {
	flake.nixosModules.joker = { config, ... }: {
		users.users.joker = {
			hashedPasswordFile = config.sops.secrets.pswdhs_joker.path;
			isNormalUser = true;
			description = "User for gaming";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
		};
		home-manager = {
			useGlobalPkgs = true;
			users.joker = {
				imports = [ self.homeModules.joker ];
			};
		};
	};

	flake.homeModules.joker = {
		imports = with self.homeModules; [
			hyprland
			hyprlandInputGame
			bash
			kitty
			ranger
			stylix
		];
		programs.home-manager.enable = true;
		home = let
			username = "joker";
		in {
			inherit username;
			stateVersion = "26.05";
			sessionVariables = {
				EDITOR = "nvim";
			};
		};
	};
}
