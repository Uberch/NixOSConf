{ lib, ... }: {
options = {
	wifi.enable =
		lib.mkEnableOption "Enable wifi";

	steam.enable =
		lib.mkEnableOption "Enable steam";

	sshd.enable =
		lib.mkEnableOption "Enables sshd module";

	kanata.enable =
		lib.mkEnableOption "Enables kanata module";

	garbage.clearOld =
		lib.mkEnableOption "Enables deletion of old generations";

	bluetooth.enable =
		lib.mkEnableOption "Enables bluetooth";
};
}
