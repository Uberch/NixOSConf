{ pkgs, ... }:
{
	users.users.joker = {
		isNormalUser = true;
		description = "User for gaming";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}
