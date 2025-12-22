{ lib, config, ... }: {
	options.hyprland.autoEnter = 
		lib.mkEnableOption
		"If user should enter hyprland automatically after login";

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
		'';

		initExtra = lib.mkIf config.hyprland.autoEnter ''
			hyprland
		'';
	};
};
}
