{
	programs.nvf.settings.vim = {
		# autocomplete.blink-cmp = {
		# 	enable = true;
		# 	mappings = {
		# 		complete = "<C-Space>";
		# 		close = "<C-e>";
		# 		confirm = "<CR>";
		# 		next = "<C-n>";
		# 		previous = "<C-p>";
		# 		scrollDocsUp = "<C-k>";
		# 		scrollDocsDown = "<C-j>";
		# 	};
		# 	setupOpts = {
		# 		completion = {
		# 			documentation.auto_show = false;
		# 			menu.auto_show = false;
		# 			# completeopt = "fuzzy,menu,menuone,noinsert,noselect,preview";
		# 			# completeopt = "menu,menuone,popup,fuzzy,noselect";
		# 			# autocomplete = false;
		# 		};
		# 	};
		# };
		autocomplete.nvim-cmp = {
			enable = true;
			mappings = {
				complete = "<C-Space>";
				close = "<C-e>";
				confirm = "<CR>";
				next = "<C-n>";
				previous = "<C-p>";
				scrollDocsUp = "<C-k>";
				scrollDocsDown = "<C-j>";
			};
			sourcePlugins = [
				# "cmp-nvim-lsp"
				"nvim-lspconfig"
				"luasnip"
			];
			setupOpts = {
				completion = {
					# completeopt = "fuzzy,menu,menuone,noinsert,noselect,preview";
					completeopt = "nosort,menu,menuone,popup,fuzzy,noselect";
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
