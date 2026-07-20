{ self, inputs, ... }: {
	flake.nixosConfigurations.apprentice = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			../_hardware/hardware-configuration.nix
			apprentice

			sops

			root
			uber

			inputs.home-manager.nixosModules.default

			amnezia
			bash
			bluetooth
			git
			pkgs
			kanata
			neovim
			networking
			stylix
			tailscale
			tmux
			utils
			virtualisation
			pipewire
		];
	};

	flake.nixosModules.apprentice = { pkgs, ... }: {
		networking.hostName = "apprentice";
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

		system.stateVersion = "25.05";

		environment.systemPackages = with pkgs; [
			firefox-bin
		];
	};
}
