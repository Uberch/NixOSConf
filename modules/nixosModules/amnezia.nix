{ inputs, ... }: {
	flake.nixosModules.amnezia = { pkgs, ... }: {
		environment.systemPackages = with pkgs; [
			amneziawg-tools
			amneziawg-go
		];
		programs.amnezia-vpn = {
			enable = true;
			package = inputs.unstable.outputs.legacyPackages."x86_64-linux".amnezia-vpn;
		};
	};
}
