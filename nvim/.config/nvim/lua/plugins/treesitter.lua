return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "agda", "c", "lua", "python", "vim", "markdown_inline", "query", "latex", "php", "perl", "rust", "csv" },
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
