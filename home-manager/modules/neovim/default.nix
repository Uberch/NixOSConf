{inputs, ...}:
{
  # Import all your configuration modules here
  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
