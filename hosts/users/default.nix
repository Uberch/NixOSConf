{ users, lib, stateVersion, nvf, ... }: {
	imports = lib.map
		(name: ./${name}/${name}.nix)
		users;

	home-manager = {
		extraSpecialArgs = { inherit nvf stateVersion; };
		users = lib.foldl' (confs: user:
			confs // {
				${user} = import ./${user}/home.nix;
			}
		) {} users;
	};
}
