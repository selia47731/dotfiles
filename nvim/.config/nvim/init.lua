vim.g.mapleader = " "
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

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 3
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"
vim.loader.enable()

-- nvim keymap settings
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })


-- Mermaid-cli settings
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.mmd",
  callback = function(args)
    local file = args.file
    local output = file:gsub("%.mmd$", ".svg")

    vim.system({
      "mmdc",
      "-i", file,
      "-o", output
    }, {text = true}, function(obj)
      if obj.code == 0 then
        vim.schedule(function()
          vim.notify(
            "Mermaid conversion failed:\n" .. (obj.stderr or ""),
            vim.log.levels.ERROR
          )
        end)
      end
    end)
  end
})

-- lazy.nvim settings
require("config.lazy")

-- nvim colorscheme settings
local term_program = vim.env.TERM_PROGRAM
vim.opt.background = "dark"
if term_program == "WezTerm" then
  vim.cmd("colorscheme cyberdream")
end
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 7
vim.cmd('highlight Normal guibg=NONE')


-- firenvim settings
if vim.g.started_by_firenvim == true then
  vim.opt.signcolumn = 'no'
  vim.opt.laststatus = 0
  vim.opt.cursorline = false
  vim.opt.fillchar:append({eob = " "})
  vim.cmd("colorscheme cyberdream")
end




-- nvim additional keymap settings
