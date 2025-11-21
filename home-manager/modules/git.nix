{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;

		userName = "Uberch";
		userEmail = "vam.molch@gmail.com";

		aliases = {
			a = "add";
			b = "branch";
			c = "commit";
			co = "checkout";
			d = "diff";
			f = "fetch";
			p = "push";
			pl = "pull";
			rs = "restore";
			s = "status";
			st = "stash";
		};
	};
}
