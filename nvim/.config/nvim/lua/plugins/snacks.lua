return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    dasdash = { enable = true },
    picker = { enable = true },
    bigfile = { enable = true },
    scope = { enable = true },
  }
}
