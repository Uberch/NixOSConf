{ users, lib, ... }: {
	imports = lib.map
		(x: ./${x}.nix)
		users;
}
