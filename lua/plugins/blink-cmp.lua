return {
  "blink.cmp",
  event = "DeferredUIEnter",
  on_require = "blink",
  after = function()
    require("blink-cmp").setup({
      keymap = {
        preset = "default",
        ["<M-j>"] = { "select_next" },
        ["<M-k>"] = { "select_prev" },
        ["<M-h>"] = { "cancel" },
        ["<M-l>"] = { "select_and_accept" },
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
