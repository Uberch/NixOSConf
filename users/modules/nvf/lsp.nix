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

				nixd = {
					enable = true;
					filetypes = [
						".nix"
					];
				};

				gopls.enable = true;
			};
		};

		languages = {
			nix = {
				enable = true;
				format.enable = true;
				lsp = {
					enable = true;
					servers = [ "nixd" ] ;
				};
			};

			go = {
				enable = true;
				lsp = {
					enable = true;
					servers = [ "gopls" ] ;
				};
			};
		};
	};
}
