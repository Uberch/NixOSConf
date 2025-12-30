{ hostname, ... }: {
	imports = [
		./modules
		./users
		./${hostname}/configuration.nix
	];
}
