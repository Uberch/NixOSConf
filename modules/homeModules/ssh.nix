{ self, ... }: {
	flake = {
		nixosModules.sops-ssh = { config, ... }: {
			imports = [ self.nixosModules.sops-base ];
			sops.templates = let
				plchldr = config.sops.placeholder;
			in {
				"ssh-vps-config" = {
					owner = "uber"; 
					path = "/run/secrets/ssh-vps-config";
					content = ''
						Host vpn
							HostName ${plchldr.vpnIp}
							User root
							IdentityFile ${config.sops.templates."ssh_id_vpn".path}
					'';
				};
				"ssh_id_github" = {
					owner = "uber";
					path = "/run/secrets/ssh_id_github";
					content = plchldr.sshk_github;
				};
				"ssh_id_archive" = {
					owner = "uber";
					path = "/run/secrets/ssh_id_archive";
					content = plchldr.sshk_archive;
				};
				"ssh_id_vpn" = {
					owner = "uber";
					path = "/run/secrets/ssh_id_vpn";
					content = plchldr.sshk_vpn;
				};
			};
		};
		homeModules.ssh = { sopsTemplates, ... }: {
			programs.ssh = {
				enable = true;

				enableDefaultConfig = false;
				includes = [
					sopsTemplates."ssh-vps-config".path
				];
				settings = {
					"*" = {
						hashKnownHosts = true;		# Hash stored known hosts
						addKeysToAgent = "yes";		# Add key identities to key agent
					};
					archive = {
						user = "avatar";
						hostname = "archive";
						identityFile = sopsTemplates."ssh_id_archive".path;
					};
					gh = {
						user = "git";
						hostname = "github.com";
						identityFile = sopsTemplates."ssh_id_github".path;
					};
				};
			};
			home.file = {
				".ssh/id_github_key.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUrefZtJR8n8bw4uf4B8zq0IW3//kGchD0RIaYTCFjb uber@apprentice";
				".ssh/id_archive_key.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINdQ7mdG2RFYZZPfEQ146IXXdCNoxlVhxB8qHIOjWZOa uber@apprentice";
				".ssh/id_vpn_key.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUVWuRsj4zdVeQeF9MXcjNFyJpPxmuKehpUx1m02C9C uber@apprentice";
			};
		};
	};
}
