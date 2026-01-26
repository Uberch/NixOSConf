{ lib, config, ... }: {
config = {
	programs.bash = {
		enable = true;
		shellAliases =
		let
			flake_path = "/home/uber/nix";
		in {
			# General purpose
			v = "$EDITOR";
			c = "clear";
			ll = "ls -la";
			rg = "ranger";
			nixpy = "nix-shell -p python3";

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
			
			# Git
			g = "git";

			# Tmux
			tn = "tmux new-session";
			ta = "tmux attach-session -t";
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
