{
	programs.nixvim.keymaps = [
		{
			action = "<Esc>";
			key = "jk";
			mode = "i";
		}
		{
			action = ":nohlsearch<CR>";
			key = ",<Space>";
			mode = "n";
		}
	];
}
