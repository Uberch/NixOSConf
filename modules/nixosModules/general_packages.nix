_: {
	flake.nixosModules.pkgs = { pkgs, ... }: {
		nixpkgs = {
			config.allowUnfree = true;
			config.allowUnfreePredicate = true;
		};

		environment.systemPackages = with pkgs; [
			git
			openssh
			ranger
			tmux
			# TBD
			zapret
			home-manager
		];
	};
}
