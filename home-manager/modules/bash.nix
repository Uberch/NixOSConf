{
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

		# Nix-related aliases
		rebuild = "sudo nixos-rebuild switch --flake ${flake_path}";
		hman = "home-manager switch --flake ${flake_path}";
		
		# Git aliases
		g = "git";
		gsp = "git add .; git statsh; git pull";
	};

	bashrcExtra = ''
		set -o vi
	'';
  };
}
