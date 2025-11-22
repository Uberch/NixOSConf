{
	programs.nixvim.opts = {
		# Positioning
		number = true;						# Enumerate lines
		relativenumber = true;			# Enumerate lines with respect to cursor
		cursorline = true;				# Color line on which cursor is placed

		# Indentation
		autoindent = true;				# Carry indentation when entering new line
		tabstop = 3;
		shiftwidth = 3;					# Width of tab
		shiftround = true;				# Round indentation to several shiftwidth when using < or > commands

		# Copy/Paste
		clipboard = "unnamedplus";		# Use '+' buffer as default clipboard

		# Search
		ignorecase = true;
		smartcase = true;					# Overwrites ignorecase when there are capital letters in searched text
		incsearch = true;					# Show results for the search text typed so far
		showmatch = true;
		hlsearch = true;					# Highlight search results

		# Displaying
		scrolloff = 8;						# Cap between cursor and top/bottom borders of screen
		breakindent = true;				# Carry indentation when one line splits on several lines
		linebreak = true;					# Break line on special chars, not at the moment it does not fit on one line
		cursorbind = true;				# Binding cursor position in diff mode
		ruler = true;						# Show cursor position
		signcolumn = "yes:1";			# Locks the size and presence of signcolumn between line number and text itself

		# Mouse (unused)
		# ttyfast = true;
		# mouse = "a";
		# mousehide = true;

		# Ungrouped
		fileencoding = "utf-8";			# File encoding, lol
		undofile = true;					# Saves undo history for file in buffer
		timeout = true;					# If enabled cancels command after timeoutlen milliseconds
		timeoutlen = 1000;				# How long (in milliseconds) to wait for next part of unfinished command
		updatetime = 4000;				# Timeout for swap file saving
		updatecount = 200;				# Number of characters before saving swap file

		# To play with
		rulerformat = "";					# Defines format of ruler info
		statusline = "";
		smarttab = true;
		softtabstop = 3;
		matchpairs = "(:),[:],{:},<:>";
		list = true;
		listchars = {
			trail = "·";
			lead = "·";
			tab = "   ";
			# eol = "↵";
			# space = "·";
		};
	};
}
