{ lib, config, pkgs, ... }: {
	options.steam.enable =
		lib.mkEnableOption "Enable steam";

config = lib.mkIf config.steam.enable {
	programs.steam = {
		enable = true;
		gamescopeSession.enable = true;
	};
	home = {
		packages = with pkgs; [
			protonup
		];
		sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS =
			"/home/joker/.steam/root/compatibilitytools.d";
	};
};
}
