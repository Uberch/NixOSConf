{
  programs.nixvim = {
    opts = {
      # Positioning
      number = true;
      relativenumber = true;
      ruler = true;
      cursorline = true;

      # Indentation
      autoindent = true;
      tabstop = 3;
      softtabstop = 3;
      shiftwidth = 3;
      smartab = true;

      # Mouse (unused for the moment)
      # scrolloff = 8;
      # ttyfast = true;
      # mouse = "a";
      # mousehide = true;

      # Copy/Paste
      # clipboard = unnamedplus;

      # Search
      showmatch = true;
      ignorecase = true;
      incsearch = true;
      hlsearch = true;

      # updatetime = 100;
      fileencoding = "utf-8";
      breakindent = true;
      undofile = true;
      signcolumn = "yes";
      timeoutlen = 300;
      splitbelow = true;
      splitright = true;
      list = true;
      # listchars = {
      #   tab = "▸ ";
      #   trail = "·";
      #   eol = "↵";
      #   space = "·";
      # };
      inccommand = "split";
    };
  };
}
