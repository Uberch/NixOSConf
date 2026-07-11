{ inputs, ... }: {
	flake.homeModules.nvf = {
		imports = [ inputs.nvf.homeManagerModules.default ];
		programs.nvf = {
			enable = true;
			defaultEditor = true;
		};
		programs.nvf.settings.vim = {
			keymaps = [
				{
					mode = "i";
					key = "jk";
					action = "<Esc>";
				}
				{
					mode = "n";
					key = ",<Space>";
					action = ":nohlsearch<CR>";
				}
			];
			options = {
					# Positioning
					number = true;							# Enumerate lines
					relativenumber = true;				# Enumerate lines with respect to cursor
					cursorline = true;					# Color line on which cursor is placed
					cursorbind = true;					# Binding cursor position in diff mode
					scrolloff = 8;							# Cap between cursor and top/bottom borders of screen

					# Indentation
					autoindent = true;					# Carry indentation when entering new line
					cindent = false;						# Perform c-style indentation formatting
					smartindent = true;					# Perform smart indentation formatting
					tabstop = 3;							# Period for max width of tibe in characters
					shiftwidth = 3;						# Width of tab
					shiftround = true;					# Round indentation to several shiftwidth when using < or > commands
					expandtab = false;

					# Displaying
					breakindent = true;					# Carry indentation when one line splits on several lines
					linebreak = true;						# Break line on special chars, not at the moment it does not fit on one line
					ruler = true;							# Show cursor position
					signcolumn = "yes:1";				# Locks the size and presence of signcolumn between line number and text itself
					matchpairs = "(:),[:],{:}";	# Symbols to be considered as pairs
					list = true;							# Enables visual change of some characters
					listchars = "tab:   ,lead:·,trail:·,multispace:··";
					# listchars = {
					# 	tab = "   ";
					# 	lead = "·";							# Changes how leading whitespaces look like
					# 	trail = "·";						# Changes how trailing whitespaces look like
					# 	multispace = "··";				# Changes how repeating whitespaces look like
					# 	# eol = "↵";
					# 	# space = "·";
					# };

					# Search
					ignorecase = true;					# Ignore case while searching
					smartcase = true;						# Overwrites ignorecase when there are capital letters in searched text
					incsearch = true;						# Show results for the search text typed so far
					showmatch = true;						# Move to nearest found match if any
					hlsearch = true;						# Highlight search results

					# Copy/Paste
					clipboard = "unnamedplus";			# Use '+' buffer as default clipboard

					# Mouse (unused)
					# ttyfast = true;
					# mouse = "a";							# Enable almost all mouse functionality
					# mousehide = true;					# Hide mouse while inserting characters until mouse moved

					# Ungrouped
					fileencoding = "utf-8";				# File encoding, lol
					undofile = true;						# Saves undo history for file in buffer
					timeout = true;						# If enabled cancels command after timeoutlen milliseconds
					timeoutlen = 1000;					# How long (in milliseconds) to wait for next part of unfinished command
					updatetime = 4000;					# Timeout for swap file saving
					updatecount = 200;					# Number of characters before saving swap file

					# To play with
					statusline = "";						# Format of status line
					rulerformat = "";						# Defines format of ruler info
					smarttab = true;
					softtabstop = 3;
				};
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

						ccls.enable = true;

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

					clang = {
						enable = true;
						lsp = {
							enable = true;
							servers = [ "ccls" ];
						};
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
		};
	}
