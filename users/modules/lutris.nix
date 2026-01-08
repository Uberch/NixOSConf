{ lib, config, ... }: {
	config = lib.mkIf config.lutris.enable {
		programs.lutris.enable = true;
	};
}
