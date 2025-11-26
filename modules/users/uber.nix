{ pkgs, ... }:
{
	users.users.uber = {
		isNormalUser = true;
		description = "Vyacheslav";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}
