return {
  "goerz/jupytext.nvim",
  version = "0.2.0",
  ft = { "jupytext", "ipynb" },
  after = "nvim-treesitter",
  opts = {
    jupytext ='jupytext',
    format = "markdown",
    update = true,
    sync_patterns = { '*.md', '*.py' },
    autosync = true,
    handle_url_schemes = true,
  },
}
