_: {
	flake.nixosModules.pozor = { pkgs, ... }: {
		services.ollama = {
			enable = true;
			host = "127.0.0.1";
			port = 11434;
			user = "ollama";
			loadModels = [
				"qwen2.5-coder:7b"
			];
		};
	};
}
