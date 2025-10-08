return {
  "lervag/vimtex",
  lazy = false,
  tag = "v2.16",
  init = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.maplocalleader = ","
  end,
  config = function()
    vim.cmd('filetype plugin indent on')
    -- vim.cmd('syntax enable')

    -- latexmk
    vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        hooks = {},
    }
  end
}
