{ lib, config, ... }: {
config = {
	programs.bash = {
		enable = true;
		shellAliases =
		let
			flake_path = "~/nix";
		in {
			# General purpose
			v = "$EDITOR";
			c = "clear";
			ll = "ls -la";
			rg = "ranger";

			# Power managment
			sdn = "systemctl poweroff";
			rbt = "reboot";

			# Nix-related
			rebuild = "sudo nixos-rebuild switch --flake ${flake_path}";
			nixtest = "sudo nixos-rebuild test --flake ${flake_path}";
			hman = "home-manager switch --flake ${flake_path}#uber";
			buildIso = ''
				nix build ${flake_path}#nixosConfigurations.iso.config.system.build.isoImage
			'';
			hmanJoker = ''
				cd ${flake_path};
				home-manager build --flake .#joker
				sudo mv result ../../joker/
			'';
			
			# Git
			g = "git";

			# Tmux
			tn = "tmux new-session";
			ta = "tmux attach-session";
			tl = "tmux list-sessions";
			tk = "tmux kill-server";
		};

		bashrcExtra = ''
			set -o vi

			if [[ $(tty) == *"pts"* ]]; then
				clear
			else
				hyprland
			fi
		'';
	};
};
}
