_: {
	flake.nixosModules.bash = {
		programs.bash = {
			enable = true;
			interactiveShellInit = ''
				set -o vi
			'';
			shellAliases =
			let
				flake_path = "~/nix";
			in {
				# General purpose
				v = "nvim";
				c = "clear";
				l = "ls";
				ll = "ls -la";
				rg = "ranger";

				# Power managment
				sdn = "systemctl poweroff";
				rbt = "reboot";

				# Nix-related
				nixbuild = "sudo nixos-rebuild switch --flake ${flake_path}";
				nixtest = "sudo nixos-rebuild test --flake ${flake_path}";
				nixboot = "sudo nixos-rebuild boot --flake ${flake_path}";
				nixiso = ''
					sudo nix run github:nix-community/disko#disko-install -- --flake ${flake_path}#iso --disk main
				'';
				
				# Git
				g = "git";

				# Tmux
				tn = "tmux new-session";
				ta = "tmux attach";
				tl = "tmux list-sessions";
				tk = "tmux kill-server";
			};
		};
	};
}
