{ lib, config, ... }: {
	options.lutris.enable =
		lib.mkEnableOption "Enable Lutris game launcher";
	
	config = lib.mkIf config.lutris.enable {
		programs.lutris.enable = true;
	};
}
