{ pkgs, ... }: {
	users.users.uber = {
		isNormalUser = true;
		description = "Main user for working/studying";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}
