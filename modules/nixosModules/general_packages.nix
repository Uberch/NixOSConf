_: {
	flake.nixosModule.garbage = { pkgs, ... }: {
		nixpkgs.config.allowUnfree = true;

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
