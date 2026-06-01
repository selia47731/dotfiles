return {
  "lambdalisue/vim-kensaku",
  dependencies = {
    "vim-denops/denops.vim",
    "lambdalisue/vim-kensaku-command"
  },
  config = function()
    vim.api.nvim_create_user_command("Search", function(opts)
      local pattern = vim.fn["kensaku#query"](opts.args)
      vim.fn.setreg("/", pattern)
      vim.cmd("normal! n")
    end, {
      nargs = "+"
    })
  end
}
