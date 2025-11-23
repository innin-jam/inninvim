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
      aliases = ["vmmvm"];
      # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };
    categories = {
      theme = true;
      general = true;
      lua = true;
      nix = true;
      python = true;
      rust = true;
      gitPlugins = true;
      markdown = true;
      typst = true;
    };
    extra = {
      nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
    };
  };
}
