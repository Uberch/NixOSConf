_: {
	flake.nixosModules.pkgs = { pkgs, ... }: {
		nixpkgs = {
			config.allowUnfree = true;
			config.allowUnfreePredicate = true;
		};

		environment.systemPackages = with pkgs; [
			git
			ranger
			tmux
			# TBD
		];
	};
}
