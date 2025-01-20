vim.g.maplocalleader = ","


-- nvim text settings
vim.opt.wrap = false
vim.opt.matchpairs:append({ '（:）', '「:」', '『:』', '【:】', '［:］', '＜:＞' })
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 10
vim.opt.foldmethod = 'marker'
vim.opt.foldmarker = "'!!!>', '<!!!'"
vim.opt.list = true
vim.opt.listchars:append({ extends = '>', precedes = '<' })

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.laststatus = 3


-- nvim IME settings
local ime_group = vim.api.nvim_create_augroup("IME", { clear = false })
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = ime_group,
  pattern = { "/", "?" },
  callback = function()
    vim.fn.system("osascript -e 'tell application \"System Events\" to key code 102'")
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = ime_group,
  callback = function()
    vim.fn.system("osascript -e 'tell application \"System Events\" to key code 102'")
  end,
})

-- nvim agda settings
vim.api.nvim_create_augroup("filetypedetect", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.agda",
  command = "set filetype=agda",
})


-- lazy.nvim settings
require("config.lazy")


-- nvim colorscheme settings
vim.opt.background = "light"
vim.cmd("colorscheme sakura")
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 7
vim.cmd('highlight Normal guibg=NONE')
