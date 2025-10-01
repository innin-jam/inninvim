inputs: {
  vinnin = {
    pkgs,
    name,
    ...
  }: {
    settings = {
      suffix-path = true;
      suffix-LD = true;
      wrapRc = true;
      aliases = ["vi"];
      # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };
    categories = {
      general = true;
      lua = true;
      nix = true;
      python = true;
      rust = true;
      gitPlugins = true;
    };
    extra = {
      nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
    };
  };
}
