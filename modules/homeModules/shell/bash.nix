_: {
	flake.homeModules.bash = {
		programs.bash = {
			enable = true;
			sessionVariables = {
				SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";
			};
			shellAliases = {
				# VPN
				vpnup = "sudo WG_QUICK_USERSPACE_IMPLEMENTATION=amneziawg-go awg-quick up amn0";
				vpndown = "sudo awg-quick down amn0";
			};
		};
	};
}
