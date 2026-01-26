{
	programs.nvf.settings.vim = {
		autocomplete.nvim-cmp = {
			enable = true;
			mappings = {
				complete = "<C-Space>";
				close = "<C-e>";
				confirm = "<CR>";
				next = "<C-n>";
				previous = "<C-p>";
			};
			sourcePlugins = [
				"cmp-nvim-lsp"
			];
			setupOpts = {
				completion = {
					completeopt = "fuzzy,menu,menuone,noinsert,noselect,preview";
					autocomplete = false;
				};
			};
		};

		lsp = {
			enable = true;
			mappings = {
				format = "<Space>f";
				openDiagnosticFloat = "<Space>e";
				goToDefinition = "<Space>d";
				goToDeclaration = "<Space>D";
				goToType = "<Space>t";
				hover = "<Space>k";
				signatureHelp = "<Space>K";
				renameSymbol = "<Space>rn";
			};

			servers = {
				"*" = {
					root_markers = [ ".git" ];
				};

				nixd.enable = true;

				gopls.enable = true;

				basedpyright = {
					enable = true;
					analysis = {
						diagnosticMode = "workspace";
					};
				};
			};
		};

		languages = {
			enableFormat = true;
			enableTreesitter = true;
			nix = {
				enable = true;
				lsp = {
					enable = true;
					servers = [ "nixd" ];
				};
				extraDiagnostics.enable = true;
			};

			go = {
				enable = true;
				lsp.enable = true;
				dap.enable = true;
			};

			python = {
				enable = true;
				format.enable = false;
				lsp.enable = true;
			};
		};
	};
}
