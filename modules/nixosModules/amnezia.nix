{ inputs, ... }: {
	flake.nixosModules.amnezia = { pkgs, ... }: {
		environment.systemPackages = with inputs.unstable.outputs.legacyPackages."x86_64-linux"; [
			amneziawg-tools
			amneziawg-go
		];
		programs.amnezia-vpn = {
			enable = true;
			package = inputs.unstable.outputs.legacyPackages."x86_64-linux".amnezia-vpn;
		};
	};
}
