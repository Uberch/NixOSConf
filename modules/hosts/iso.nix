{ self, inputs, ... }: {
	flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			../_hardware/hardware-configuration.nix
			iso

			root

			git
			pkgs
			kanata
			neovim
			networking
			tmux
			experimental
		];
	};

	flake.nixosModules.iso = { pkgs, ...}: {
		networking.hostName = "iso";
		system.stateVersion = "26.05";

		# Configure keymap in X11
		services.xserver.xkb = {
			layout = "us";
			variant = "";
		};

		environment.systemPaackages = [
			pkgs.disko
		];
	};
}

