{ self, ... }: {
	flake.nixosModules.uber = {
		users.users.uber = {
			isNormalUser = true;
			description = "Main user for working/studying";
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
				imports = [ self.homeModules.uber ];
			};
		};
	};

	flake.homeModules.uber = { pkgs, ... }: {
		imports = with self.homeModules; [
			hyprland
			hyprlandInputWork
			bash
			kitty
			ranger
			ssh
			stylix
			tmux
		];
		programs.home-manager.enable = true;
		home = let
			username = "uber";
		in {
			inherit username;
			stateVersion = "25.05";
			sessionVariables = {
				EDITOR = "nvim";
			};
			packages = with pkgs; [
				just
				telegram-desktop
				python3
				obsidian
			];
		};
	};
}
