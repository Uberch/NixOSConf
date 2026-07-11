{ self, ... }: {
	flake.nixosModules.root = {
		home-manager = {
			useGlobalPkgs = true;
			users.root = {
				imports = [ self.homeModules.root ];
			};
		};
		programs.bash = {
			enable = true;
			shellAliases = {
				v = "nvim";
				c = "clear";
				ll = "ls -la";
				rg = "ranger";
				sdn = "systemctl poweroff";
				rbt = "reboot";
				g = "git";
				t = "tmux";
			};
			interactiveShellInit = ''
				set -o vi
			'';
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
