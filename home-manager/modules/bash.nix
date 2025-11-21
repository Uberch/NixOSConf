{ config, pkgs, ... }:

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
		hman = "home-manager switch ${flake_path}";
		# Git aliases
		ga = "git add";
		gb = "git branch";
		gc = "git commit";
		gch = "git checkout";
		gd = "git diff";
		gf = "git fetch";
		gp = "git push";
		gpl = "git pull";
		grm = "git rm";
		grs = "git restore";
		gs = "git status";
		gst = "git stash";
		gsp = "git add .; git statsh; git pull";
	};

	bashrcExtra = ''
		set -o vi
	'';
  };
}
