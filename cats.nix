inputs: let
  inherit (inputs.nixCats) utils;
in
  {
    pkgs,
    settings,
    categories,
    extra,
    name,
    mkPlugin,
    ...
  } @ packageDef: {
    # to define and use a new category, simply add a new list to a set here,
    # and later, you will include categoryname = true; in the set you
    # provide when you build the package using this builder function.
    # see :help nixCats.flake.outputs.packageDefinitions for info on that section.

    # lspsAndRuntimeDeps:
    # this section is for dependencies that should be available
    # at RUN TIME for plugins. Will be available to PATH within neovim terminal
    # this includes LSPs
    lspsAndRuntimeDeps = with pkgs; {
      general = [
        # Prettier
        nodePackages.prettier
      ];
      lua = [
        lua-language-server
        stylua
      ];
      nix = [
        nixd
        alejandra
      ];
      python = [
        pyright
        black
      ];
      rust = [
        (extra.rust.toolchain or inputs.fenix.packages.${system}.latest.toolchain)
        rustup
      ];
    };

    # This is for plugins that will load at startup without using packadd:
    startupPlugins = with pkgs.vimPlugins; {
      general = [
        lze
        lzextras
        rose-pine
        mini-icons
      ];
      rust = [
        rustaceanvim
      ];
    };

    # not loaded automatically at startup.
    # use with packadd and an autocommand in config to achieve lazy loading
    optionalPlugins = {
      gitPlugins = with pkgs.neovimPlugins; [];
      general = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        conform-nvim
        nvim-lint
        blink-cmp
        nvim-treesitter-endwise
        nvim-autopairs
        nvim-ts-autotag
        fzf-lua
        fyler-nvim
        nvim-lspconfig
      ];
      lua = with pkgs.vimPlugins; [
        lazydev-nvim
      ];
    };

    # shared libraries to be added to LD_LIBRARY_PATH
    # variable available to nvim runtime
    sharedLibraries = {
      general = with pkgs; [
        # libgit2
      ];
    };

    # environmentVariables:
    # this section is for environmentVariables that should be available
    # at RUN TIME for plugins. Will be available to path within neovim terminal
    environmentVariables = {
      # test = {
      #   CATTESTVAR = "It worked!";
      # };
    };

    # If you know what these are, you can provide custom ones by category here.
    # If you dont, check this link out:
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
    extraWrapperArgs = {
      # test = [
      #   '' --set CATTESTVAR2 "It worked again!"''
      # ];
    };

    # lists of the functions you would have passed to
    # python.withPackages or lua.withPackages
    # do not forget to set `hosts.python3.enable` in package settings

    # get the path to this python environment
    # in your lua config via
    # vim.g.python3_host_prog
    # or run from nvim terminal via :!<packagename>-python3
    python3.libraries = {
      test = _: [];
    };
    # populates $LUA_PATH and $LUA_CPATH
    extraLuaPackages = {
      test = [(_: [])];
    };
  }
