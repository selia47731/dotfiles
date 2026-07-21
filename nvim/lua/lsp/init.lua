-- lsp configurations

vim.lsp.config('*', {
  capabilities = require("ddc_souce_lsp").make_client_capabilities(),
})

local lua_ls = require("lsp.lua_ls")
local pyright = require("lsp.pyright")
local texlab = require("lsp.texlab")
local harper_ls = require("lsp.harper_ls")
local denols = require("lsp.denols")


-- lsp enable
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('texlab')
vim.lsp.enable('harper_ls')
vim.lsp.enable('denols')
