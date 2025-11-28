{ lib, config, ... }: {
options = {
	garbage.clearOld =
		lib.mkEnableOption "Enables deletion of old generations";
};

config = {
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = lib.mkIf config.garbage.clearOld "--delete-older-than 7d";
		randomizedDelaySec = "15m";
		persistent = true;
	};
};
}
