return {
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME .. '/lua',
        },
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
