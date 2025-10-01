return {
  "conform.nvim",
  -- enabled = nixCats.general or false,
  after = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        json = { "prettier" },
        jsonc = { "prettier" },
        markdown = { "prettier" },
        python = { "black" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })

    conform.formatters.prettier = function(bufnr)
      return {
        prepend_args = {
          "--prose-wrap",
          "always",
          "--print-width",
          "66",
          "--trailing-comma",
          "none",
        },
      }
    end

    conform.formatters.stylua = function(bufnr)
      return {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      }
    end

    vim.keymap.set("n", "<leader>FF", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "[F]ormat [F]ile" })
  end,
}
