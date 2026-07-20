{ self, inputs, ... }: {
	flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			"${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
			../_hardware/hardware-configuration.nix
			iso

			bash
			git
			pkgs
			kanata
			neovim
			tmux
			experimental
		];
	};

	flake.nixosModules.iso = { pkgs, lib, ... }: {
		users.users.nixos = {
			name = "nixos";
			description = "Live ISO user";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
		};
		programs.bash = {
			enable = true;
			shellAliases = {
				v = "nvim";
				c = "clear";
				ll = "ls -la";
				rg = "ranger";
				sdn = "systemctl poweroff";
				rbt = "reboot";
				g = "git";
				t = "tmux";
			};
			interactiveShellInit = ''
				set -o vi
			'';
		};
		networking = {
			hostName = "iso";
			networkmanager.enable = lib.mkForce false;
			wireless = {
				enable = true;
			};
		};
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

