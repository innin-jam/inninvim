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
  },
  {
    "nvim-ts-autotag",
    event = "InsertEnter",
  },
})

require("plugins.lsp")
