{ config, pkgs, ... }: {
	networking.hostName = "nixos";

	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./packages.nix
			./modules.nix
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	system.stateVersion = "25.05";
}
