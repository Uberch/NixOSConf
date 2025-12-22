{ lib, config, pkgs, ... }: {
	options.steam.enable =
		lib.mkEnableOption "Enable steam";

config = lib.mkIf config.steam.enable {
	programs = {
		steam = {
			enable = true;
			gamescopeSession.enable = true;
		};
		gamemode.enable = true;
		programs.gamescope = {
			enable = true;
			capSysNice = true;
		};
	};
	environment = {
		systemPackages = with pkgs; [
			protonup
		];
		sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS =
			"/home/joker/.steam/root/compatibilitytools.d";
	};
#
# 	boot.kernelParams = [ "quiet" "splash" "console=/dev/null" ];
# 	boot.plymouth.enable = true;
#
# # Gamescope Auto Boot from TTY (example)
# services.xserver.enable = false; # Assuming no other Xserver needed
# services.getty.autologinUser = "USERNAME_HERE";
#
# services.greetd = {
#   enable = true;
#   settings = {
#     default_session = {
#       command = "${pkgs.gamescope}/bin/gamescope -W 1920 -H 1080 -f -e --xwayland-count 2 --hdr-enabled --hdr-itm-enabled -- steam -pipewire-dmabuf -gamepadui -steamdeck -steamos3 > /dev/null 2>&1";
#       user = "USERNAME_HERE";
#     };
#   };
# };
#
};
}
