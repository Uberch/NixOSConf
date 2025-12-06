{ hostname, ... }: {
	imports = [
		./modules
		./${hostname}/configuration.nix
	];
}
