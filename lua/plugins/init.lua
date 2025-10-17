require("lze").load({
  {
    import = "plugins.treesitter",
  },
  {
    "nvim-treesitter-endwise",
    event = "BufReadPost",
  },
  {
    import = "plugins.conform",
  },
  {
    import = "plugins.lint",
  },
  {
    import = "plugins.blink-cmp",
  },
  {
    import = "plugins.telescope",
  },
  {
    import = "plugins.fyler",
  },
  {
    import = "plugins.lazydev",
  },
  {
    import = "plugins.render-markdown",
  },
  {
    import = "plugins.rustaceanvim",
  },
  {
    "nvim-autopairs",
    event = "InsertEnter",
    after = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "nvim-ts-autotag",
    event = "InsertEnter",
    after = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "quickmath.nvim",
    cmd = { "Quickmath" },
  },
  {
    "tiny-devicons-auto-colors.nvim",
    after = function()
      require("tiny-devicons-auto-colors").setup()
    end,
  },
})

require("plugins.lsp")
