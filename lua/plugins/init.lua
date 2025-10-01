require("lze").load({
  {
    import = "plugins.treesitter",
  },
  {
    import = "plugins.blink-cmp",
  },
  {
    import = "plugins.conform",
  },
  {
    import = "plugins.fyler",
  },
  {
    import = "plugins.fzf-lua",
  },
  {
    "nvim-treesitter-endwise",
    event = "BufReadPost",
  },
  {
    "nvim-autopairs",
    event = "InsertEnter",
    after = function(_)
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "nvim-ts-autotag",
    event = "InsertEnter",
    after = function(_)
      require("nvim-ts-autotag").setup({})
    end,
  },
  {
    -- lazydev makes your lsp way better in your config without needing extra lsp configuration.
    "lazydev.nvim",
    enabled = nixCats("lua") or false,
    cmd = { "LazyDev" },
    ft = "lua",
    after = function(_)
      require("lazydev").setup({
        library = {
          { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. "/lua" },
        },
      })
    end,
  },
})

require("plugins.lsp")
