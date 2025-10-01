return {
  "nvim-treesitter",
  event = "DeferredUIEnter",
  load = function(name)
    vim.cmd.packadd(name)
    vim.cmd.packadd("nvim-treesitter-textobjects")
  end,
  after = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-h>",
          node_incremental = "<c-h>",
          scope_incremental = "<m-c-h>",
          node_decremental = "<c-l>",
        },
      },
    })
  end,
}
