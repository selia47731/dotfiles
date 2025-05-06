return {
  "lambdalisue/kensaku.vim",
  dependencies = {
    "vim-denops/denops.vim",
  },
  config =function()
    vim.cmd[[
      function! Search(value) abort
        let @/ = a:value
        nomal! n
      endfunction
    ]]
  end,
}
