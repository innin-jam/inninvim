vim.keymap.set("n", "<leader>e", function()
  vim.cmd("Fyler")
end, { desc = "Open File Manager" })

return {
  "fyler.nvim",
  cmd = "Fyler",
  -- enabled = nixCats().general or false,
  after = function()
    require("fyler").setup({
      icon_provider = "nvim_web_devicons",
      default_explorer = true,
      mappings = {
        ["<Esc>"] = "CloseView",
      },
      win = {
        border = "single",
        kind = "float",
        win_opts = {
          -- number = false,
          relativenumber = false,
        },
      },
      popups = {
        permission = {
          border = "single",
        },
      },
    })
  end,
}
