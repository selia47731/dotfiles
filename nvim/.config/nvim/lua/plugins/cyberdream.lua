return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "auto",
      transparent = true,
      saturation = 1,
      itaric_comments = true,
      hide_fillchars = false,
      borderless_pickers = true,
      terminal_colors = true,
      cache = false,

      extensions = {
        dashboard = true,
        lazy = true,
        telescope = true,
        treesitter = true,
        notify = true,
      },
    })
  end,
}
