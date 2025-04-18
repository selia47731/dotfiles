vim.g.maplocalleader = ","


-- nvim text settings
vim.opt.modifiable = true
vim.opt.wrap = false
vim.opt.matchpairs:append({ '（:）', '「:」', '『:』', '【:】', '［:］', '＜:＞' })
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
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })


-- nvim IME settings
local ime_group = vim.api.nvim_create_augroup("IME", { clear = false })
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = ime_group,
  pattern = { "/", "?" },
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.British")
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = ime_group,
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.British")
  end,
})


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
vim.api.nvim_create_augroup("filetypedetect", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.agda",
  command = "set filetype=agda",
})

-- nvim jupytext settings
vim.api.nvim_create_augroup("filetypedetect", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.ipynd",
  command = "set filetype=jupytext",
})

-- lazy.nvim settings
require("config.lazy")

-- nvim colorscheme settings
vim.opt.background = "dark"
vim.cmd("colorscheme sakura")
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 7
vim.cmd('highlight Normal guibg=NONE')

-- nvim additional keymap settings
