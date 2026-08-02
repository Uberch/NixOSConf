{ inputs, self, ... }: {
	flake.nixosModules = {
		minecraft-TFG = {
			imports = [
				self.nixosModules.minecraft-basic
			];
			services.minecraft-servers.servers.TFG = {
				enable = false;
				# WIP
			};
		};

		minecraft-matcha = { pkgs, ... }: {
			imports = [
				self.nixosModules.minecraft-basic
			];
			services.minecraft-servers.servers.matcha = let
				datapack = pkgs.fetchzip {
					url = "https://cdn.modrinth.com/data/QI0EmgZ1/versions/2OaIqKKy/Matcha_Flavoured_1_03.zip";
					sha512 = "sha512-z29tqhvtjeodN5ylwpztZgXEwKpj0dQ/gAw1Qm9DggogdHSxuUoorgE7tPCybzOAsCbbJ4lO4RGG8E6w/zaibQ==";
					stripRoot = false;
				};
			in {
				enable = true;
				package = pkgs.vanillaServers.vanilla-26_2;
				symlinks = {
					"world/datapacks/matcha" = datapack;
				};
				operators."Uber__" = {
					level = 3;
					uuid = "27459327-76e3-3267-9656-08ca5ff01aba";
				};
				serverProperties = {
					server-ip = "0.0.0.0";
					server-port = 10000;
					motd = "Matcha flavoured datapack";
					difficulty = 1;
					gamemode = 0;
					max-players = 1;
					online-mode = false;
					"pause-when-empty-seconds" = 10;
					"level-name" = "world";
				};
			};
		};

		minecraft-basic = {
			imports = [
				inputs.nix-minecraft.nixosModules.minecraft-servers
			];
			nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

			services.minecraft-servers = {
				enable = true;
				eula = true;
				openFirewall = true;
			};
		};
	};
}
