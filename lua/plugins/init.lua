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
    import = "plugins.lazydev",
  },
  {
    import = "plugins.render-markdown",
  },
  {
    import = "plugins.rustaceanvim",
  },
  {
    import = "plugins.flash",
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
  {
    "undotree",
    after = function()
      vim.keymap.set({ "n", "v", "x" }, "<leader>u", function()
        vim.cmd.UndotreeToggle()
        vim.cmd.UndotreeFocus()
      end, { desc = "Toggle Undotree" })
    end,
  },
  {
    "markdown-preview.nvim",
  },
  {
    "typst-preview.nvim",
  },
  {
    "oil.nvim",
    after = function()
      require("oil").setup()
      vim.keymap.set({ "n", "v", "x" }, "<leader>e", function()
        vim.cmd.Oil()
      end)
    end,
  },
})

require("plugins.lsp")
