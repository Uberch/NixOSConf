{ hostname, ... }: {
	networking.hostName = hostname;

	imports = [
		./options.nix

		./neovim
		./zapret
		./bluetooth.nix
		./experimental.nix
		./garbage.nix
		./general_packages.nix
		./kanata.nix
		./localization.nix
		./networking.nix
		./opengl.nix
		./sshd.nix
		./steam.nix
		./stylix.nix
		./tmux.nix
	];
}
