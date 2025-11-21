vim.g.maplocalleader = ","


-- nvim text settings
vim.opt.modifiable = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 10
vim.opt.foldmethod = 'marker'
vim.opt.foldmarker = "'!!!>', '<!!!'"
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.listchars:append({ extends = '>', precedes = '<' })

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 3
vim.opt.incsearch = true

-- nvim keymap settings
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- nvim IME settings
-- local ime_group = vim.api.nvim_create_augroup("IME", { clear = false })
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   group = ime_group,
--   pattern = { "/", "?" },
--   callback = function()
--     vim.fn.system("im-select com.apple.keylayout.British")
--   end,
-- })

-- vim.api.nvim_create_autocmd("InsertLeave", {
--   group = ime_group,
--   callback = function()
--     vim.fn.system("im-select com.apple.keylayout.British")
--   end,
-- })


-- nvim scratchpad settings
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "scratchpad.md", "scratchpad.org" },
  callback =function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.spell = true
    vim.wo.spelllang = { "ja" }
  end,
})

-- nvim agda settings
local agda_group = vim.api.nvim_create_augroup("filetypedetect_agda", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = agda_group,
  pattern = "*.agda",
  callback = function()
    vim.bo.filetype = "agda"
  end,
})

-- nvim jupytext settings
local ipynb_group = vim.api.nvim_create_augroup("filetypedetect_ipynb", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = ipynb_group,
  pattern = "*.ipynb",
  callback = function()
    vim.bo.filetype = "ipynb"
  end,
})

-- lazy.nvim settings
require("config.lazy")

-- nvim colorscheme settings
local term_program = vim.env.TERM_PROGRAM
vim.opt.background = "dark"
if term_program == "iTerm.app" then
  vim.cmd("colorscheme sakura")
elseif term_program == "WezTerm" then
  vim.cmd("colorscheme cyberdream")
end
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 7
vim.cmd('highlight Normal guibg=NONE')

-- nvim additional keymap settings
