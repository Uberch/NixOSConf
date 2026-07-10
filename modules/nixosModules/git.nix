_: {
	flake.nixosModules.git = {
		programs.git = {
			enable = true;

			config = {
				user = {
					name = "Uberch";
					email = "vam.molch@gmail.com";
				};

				init = {
					defaultBranch = "main";
				};

				alias = {
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
		};
	};
}
