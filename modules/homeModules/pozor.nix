_: {
	flake.homeModules.pozor = { pkgs, lib, ... }: {
		home = {
			packages = with pkgs; [
					pi-coding-agent
			];
			file.".pi/agent/models.json".text = builtins.toJSON {
				providers = {
					ollama = {
						api = "openai-completions";
						apiKey = "ollama";
						authHeader = false;
						baseUrl = "http://127.0.0.1:11434/v1";
						models = [
							{
								id = "qwen2.5-coder:7b";
								name = "ollama/qwen";
								reasoning = false;
								contextWindow = 128000;
							}
						];
					};
				};
			};
		};
	};
}
