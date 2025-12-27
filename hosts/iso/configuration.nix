{ stateVersion, modulesPath, config, ... }: {
	imports =
		[ # Include the results of the hardware scan.
			"${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
			./packages.nix
			./modules.nix
		];

	# Bootloader.
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		kernelModules = [ "wl" ];
		extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];
		blacklistedKernelModules = [ "b43" "bcma" ];
	};
	nixpkgs.config.permittedInsecurePackages = [
		"broadcom-sta-6.30.223.271-59-6.12.58"
	];

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	system.stateVersion = stateVersion;
	networking.wireless.enable = true;
}
