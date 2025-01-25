return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }, -- 必要なLSPを指定
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- LSPサーバーの設定例: Lua用
      lspconfig.lua_ls.setup({
          Lua = {
            runtime = {
              version = "LuaJIT",
              pathStrict = true,
              path = { "?.lua", "?/init.lua" },
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
      })
      lspconfig.harper_ls.setup({
        settings = {
          ["harper-ls"] = {
            userDictPath = "~/.config/nvim/dict.txt"
          }
        }
      })
      lspconfig.denols.setup({})
      lspconfig.texlab.setup({})
      lspconfig.pyright.setup({})
    end,
  }
}
