{ users, lib, nvf, unstablePkgs, ... }: {
	imports = lib.map
		(name: ./${name}/${name}.nix)
		users;

	home-manager = {
		extraSpecialArgs = { inherit nvf unstablePkgs; };
		users = lib.foldl' (confs: user:
			confs // {
				${user} = import ./${user}/home.nix;
			}
		) {} users
		// {
			root = import ./root/home.nix;
		};
	};
}
