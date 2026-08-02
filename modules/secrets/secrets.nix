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
				vpnUrl = {};
				vpnIp = {};
				headscalePort = {};
				headscaleKey = {};
				# Password hashes
				pswdhs_root = {
					neededForUsers = true;
				};
				pswdhs_uber = {
					neededForUsers = true;
				};
				pswdhs_joker = {
					neededForUsers = true;
				};
				pswdhs_avatar = {
					neededForUsers = true;
				};
				# SSH keys
				sshk_archive = {};
				sshk_github = {};
				sshk_vpn = {};
			};
		};
	};
}
