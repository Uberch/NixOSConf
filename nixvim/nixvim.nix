{ ... }:
{
	programs.nixvim.enable = true;

	imports = [
		./modules
	];
}
