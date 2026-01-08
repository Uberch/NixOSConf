{ pkgs, ... }: {
	users.users.avatar = {
		isNormalUser = true;
		description = "User for ssh connection";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}
