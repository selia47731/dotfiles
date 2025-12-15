return {
  "nwiizo/marp.nvim",
  ft = "markdown",
  config = function()
    require("marp").setup({
      marp_command = "/opt/homebrew/bin/node /opt/homwbrew/bin/marp",
      browser = nil, -- auto-detect
      server_mode = false, -- Use watch mode (-w)

      themes = {
        default = "default",
        gaia = "gaia",
        uncover = "uncover",
      },

      export_formats = {
        html = "--html",
        pdf = "--pdf",
        pptx = "--pptx",
        png = "--image png",
        jpeg = "--image jpeg",
      },

      show_tips = true,
      auto_copy_path = true,
      show_file_size = true,
      suggest_gitignore = true,
      debug = false,
      html_option = true,
    })
  end,
}
