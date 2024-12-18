return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "agda", "c", "lua", "python", "vim", "markdown", "query", "latex", "php", "perl", "rust" },
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
