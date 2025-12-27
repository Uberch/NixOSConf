{ lib, config, ... }: {
config = lib.mkIf config.bluetooth.enable {
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
};
}
