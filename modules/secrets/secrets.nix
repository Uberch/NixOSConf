{ inputs, ... }: {
	flake.nixosModules.sops-base = { pkgs, ... }: {
		imports = [
			inputs.sops-nix.nixosModules.sops
		];
		environment.systemPackages = with pkgs; [
			sops age
		];
		sops = {
			defaultSopsFile = ./secrets.yaml;
			defaultSopsFormat = "yaml";
			
			age.keyFile = "/var/lib/sops-nix/key.txt";

			secrets = {
				vpnIp = {};
				headscalePort = {};
				headscaleKey = {};
				root_password_hash = {
					neededForUsers = true;
				};
				uber_password_hash = {
					neededForUsers = true;
				};
				joker_password_hash = {
					neededForUsers = true;
				};
				avatar_password_hash = {
					neededForUsers = true;
				};
				ssh_key_archive = {};
				ssh_key_github = {};
				ssh_key_vpn = {};
			};
		};
	};
}
