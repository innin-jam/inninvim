return {
  "blink.cmp",
  event = "DeferredUIEnter",
  on_require = "blink",
  after = function()
    require("blink-cmp").setup({
      keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    })
  end,
}
