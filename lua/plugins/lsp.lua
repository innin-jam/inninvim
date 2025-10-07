local function lsp_on_attach(_, bufnr)
  -- we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.

  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")
end

require("lze").register_handlers(require("lzextras").lsp)
require("lze").h.lsp.set_ft_fallback(function(name)
  return dofile(
    nixCats.pawsible({ "allPlugins", "opt", "nvim-lspconfig" }) .. "/lsp/" .. name .. ".lua"
  ).filetypes or {}
end)

require("lze").load({
  {
    "nvim-lspconfig",
    on_require = { "lspconfig" },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function(_)
      vim.lsp.config("*", {
        on_attach = lsp_on_attach,
      })
    end,
  },
  {
    "lua_ls",
    enabled = true,
    lsp = {
      -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          formatters = {
            ignoreComments = true,
          },
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { "nixCats", "vim" },
            disable = { "missing-fields" },
          },
          telemetry = { enabled = false },
        },
      },
    },
  },
  {
    "pyright",
    lsp = {
      filetypes = { "python" },
    },
  },
  {
    "nixd",
    lsp = {
      filetypes = { "nix" },
    },
    settings = {
      nixd = {
        -- nixd requires some configuration.
        -- luckily, the nixCats plugin is here to pass whatever we need!
        -- we passed this in via the `extra` table in our packageDefinitions
        -- for additional configuration options, refer to:
        -- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
        nixpkgs = {
          -- in the extras set of your package definition:
          -- nixdExtras.nixpkgs = ''import ${pkgs.path} {}''
          expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
        },
        options = {
          nixos = {
            -- nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options''
            expr = nixCats.extra("nixdExtras.nixos_options"),
          },
        },
        formatting = {
          command = { "alejandra" },
        },
        diagnostic = {
          suppress = {
            "sema-escaping-with",
          },
        },
      },
    },
  },
  {
    "markdown-oxide",
    lsp = {
      filetypes = { "markdown" },
    },
  },
})
