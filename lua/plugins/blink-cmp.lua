return {
  "blink.cmp",
  event = "DeferredUIEnter",
  on_require = "blink",
  after = function()
    require("blink-cmp").setup({
      keymap = {
        preset = "default",
        ["<Down>"] = { "select_next" },
        ["<Up>"] = { "select_prev" },
        ["<Left>"] = { "cancel" },
        ["<c-y>"] = { "select_and_accept" },
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
