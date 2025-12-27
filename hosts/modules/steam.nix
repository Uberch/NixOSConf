{ lib, config, pkgs, ... }: {
config = lib.mkIf config.steam.enable {
	programs = {
		steam = {
			enable = true;
			gamescopeSession.enable = true;
			extraCompatPackages = with pkgs; [
			  proton-ge-bin
			] ;
		};
		gamemode.enable = true;
		gamescope = {
			enable = true;
			capSysNice = true;
		};
	};
	environment = {
		sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS =
			"/home/joker/.steam/root/compatibilitytools.d";
	};
};
}
