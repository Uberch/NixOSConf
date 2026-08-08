{ self, inputs, ... }: {
	flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {
			inherit inputs;
		};
		modules = with self.nixosModules; [
			iso
			inputs.disko.nixosModules.disko

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
		imports = [
			self.diskoConfigurations.iso
		];

		disko.enableConfig = false;
		fileSystems = {
			"/" = {
				device = "/dev/disk/by-partlabel/disk-main-root";
				fsType = "ext4";
				options = [ "noatime" "nodiratime" "commit=60" ];

			};
			"/boot" = {
				device = "/dev/disk/by-partlabel/disk-main-ESP";
				fsType = "vfat";
				options = [ "umask=0077" ];
			};
		};
		boot = {
			loader = {
				systemd-boot.enable = true;
				efi = {
					canTouchEfiVariables = false;
					efiSysMountPoint = "/boot/efi";
				};
			};
			initrd.availableKernelModules = [ 
				"xhci_pci"
				"uhci_hcd"
				"ehci_pci"
				"usb_storage"
				"uas"
				"sd_mod"
			];
		};

		services = {
			journald.extraConfig = "Storage=volatile";
			getty.autologinUser = "nixos";
			xserver.xkb = {
				layout = "us";
				variant = "";
			};
		};

		swapDevices = [ ];

		security = {
			sudo = {
				enable = true;
				extraRules = [{
					users = [ "nixos" ];
					commands = [{
						command = "ALL";
						options = [ "NOPASSWD" ];
					}];
				}];
			};
			polkit = {
				enable = true;
				extraConfig = ''
					addRule(function(action, subject) {
						if (subject.isInGroup("wheel")) {
							return polkit.Result.YES;
						}
					});
				'';
			};
		};
		users.users.nixos = {
			name = "nixos";
			description = "Live ISO user";
			isNormalUser = true;
			extraGroups = [
				"wheel"
				"networkmanager"
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
			wireless.enable = true;
		};
		system.stateVersion = "26.05";

		environment.systemPackages = [
			pkgs.disko
		];
	};
}

