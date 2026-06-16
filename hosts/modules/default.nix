{ hostname, ... }: {
	networking.hostName = hostname;

	imports = [
		./options.nix

		./neovim
		./zapret

		./bluetooth.nix
		./documentation.nix
		./dns.nix
		./experimental.nix
		./garbage.nix
		./general_packages.nix
		./kanata.nix
		./localization.nix
		./logind.nix
		./networking.nix
		./opengl.nix
		./sshd.nix
		./steam.nix
		./stylix.nix
		./tmux.nix
		./virtualization.nix
	];
}
