{ lib, config, ... }: {
	config = lib.mkIf config.wifi.enable {
		networking.networkmanager.enable = true;
	};
}
