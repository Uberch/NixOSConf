{ self, inputs, ... }: {
	flake.nixosConfigurations.archive = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			../_hardware/hardware-configuration.nix
			archive

			root
			avatar

			inputs.home-manager.nixosModules.default

			bash
			git
			pkgs
			kanata
			neovim
			networking
			stylix
			sshd
			tailscale
			teamspeak
			tmux
			utils
			virtualisation
		];
	};

	flake.nixosModules.archive = { pkgs, ... }: {
		networking.hostName = "archive";
		# Bootloader.
		boot.loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};

		# Configure keymap in X11
		services.xserver.xkb = {
			layout = "us";
			variant = "";
		};

		system.stateVersion = "26.05";

		environment.systemPackages = with pkgs; [
			firefox-bin
		];
	};
}
