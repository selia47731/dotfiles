return {
  "delphinus/md-render.nvim",
  dependencies = {
    { "delphinus/budoux.lua", version = "*"},
    {"nvim-tree/nvim-web-devicons"}
  },
  config = function()
    vim.keymap.set("n", "<Leader>md", "<cmd>MdRender auto<CR>")
  end
}
