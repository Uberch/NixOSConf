{
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = "--delete-older-than 7d";
		randomizedDelaySec = "15m";
		persistent = true;
	};
}
