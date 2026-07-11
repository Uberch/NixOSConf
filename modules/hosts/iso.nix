{ self, inputs, ... }: {
	flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			"${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
			../_hardware/hardware-configuration.nix
			iso

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

		environment.systemPackages = [
			pkgs.disko
		];
	};
}

