return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    start_in_insert = true,
    close_on_exit = true,
    persist_size = true,
    flofloat_opts = {
      border = "rounded",
    }
  },
  keys = {
    { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  },
  cconfig = function(_, opts)
    require("toggleterm").setup(opts)

    vim.apiapi.nvim_create_autocmd("TermOpen", {
      callback = function()
        local map = vim.keymap.set
        local o = { buffer = true, silent = true }

        map("t", "<esc>", [[<C-\><C-n>]], o)
        map("t","<C-h>", "<Cmd>wincmd h<cr>", o)
        map("t","<C-j>", "<Cmd>wincmd j<cr>", o)
        map("t","<C-k>", "<Cmd>wincmd k<cr>", o)
        map("t","<C-l>", "<Cmd>wincmd l<cr>", o)
      end
    })
  end
}
