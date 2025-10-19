return {
  "vim-denops/denops.vim",
  config = function()
    local deno_path = vim.fn.exepath("deno")
    vim.g['denops#deno'] = deno_path
  end,
}
