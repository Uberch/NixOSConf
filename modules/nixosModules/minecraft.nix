{ inputs, ... }: {
	flake.nixosModules.minecraft = { pkgs, lib, ... }: {
		imports = [
			inputs.nix-minecraft.nixosModules.minecraft-servers
		];
		nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

		services.minecraft-servers = {
			enable = true;
			eula = true;
			openFirewall = true;

			servers = {
				TFG = {
					enable = false;
					# WIP, because forge is not yet supported
				};
				vanilla = {
					enable = true;
					package = pkgs.vanillaServers.vanilla-1_21;
					serverProperties = {
						difficulty = 1;
						gamemode = 1;
						max-players = 3;
						motd = "Test server";
						server-port = 11111;
						server-ip = "100.64.0.6";
						online-mode = false;
					};
				};
			};
		};
	};
}
