return {
  "goerz/jupytext.nvim",
  version = "0.2.0",
  opts = {
    jupytext ='jupytext',
    format = "markdown",
    update = true,
    sysc_pattern = { '*.md', '*.py' },
    autosync = true,
    handle_url_schemes = true,
  },
  config = function()
    require("jupytext").setup({ opts,
      filetype = require("jupytext").get_filetype,
    })
  end
}
