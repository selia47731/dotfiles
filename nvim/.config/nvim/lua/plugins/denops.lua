return {
  "vim-denops/denops.vim",
  config = function()
    vim.g['denops#deno'] = os.getenv('HOME') .. '/.dvm/bin/deno'
  end,
}
