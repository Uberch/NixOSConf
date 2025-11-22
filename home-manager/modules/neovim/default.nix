{inputs, ...}:
{
  # Import all your configuration modules here
  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
