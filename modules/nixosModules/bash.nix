_: {
	flake.nixosModules.bash = {
		programs.bash = {
			enable = true;
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
				buildIso = ''
					nix build ${flake_path}#nixosConfigurations.iso.config.system.build.isoImage
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
