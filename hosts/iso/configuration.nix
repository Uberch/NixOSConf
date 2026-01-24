{ stateVersion, modulesPath, ... }: {
	imports = [
		"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
		./packages.nix
		./modules.nix
	];

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	system.stateVersion = stateVersion;
}
