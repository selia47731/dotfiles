return {
  'IogaMaster/neocord',
  event = "VeryLazy",
  config = function()
    require("neocord").setup({
      -- General options
      logo                = "auto",
      logo_tooltip        = nil,
      main_image          = "language",
      log_level           = nil,
      debounce_timeout    = 10,
      blacklist           = {},
      file_assets         = {},
      show_time           = true,
      global_timer        = false,

      -- Rich Presence text options
      editing_text        = function()
        local ft = vim.bo.filetype or "unknown"
        return "Editing a " .. ft .. " file"
      end,
      file_explorer_text  = function()
        local ft = vim.bo.filetype or "unknown"
        return "Browsing " .. ft .. " files"
      end,
      git_commit_text     = function()
        local branch = vim.b.gitsigns_head or "unknown"
        return "Committing to " .. branch
      end,
      plugin_manager_text = function()
        return "Managing plugins"
      end,
      reading_text        = function()
        local ft = vim.bo.filetype or "unknown"
        return "Reading a " .. ft .. " file"
      end,
      workspace_text      = function()
        local ft = vim.bo.filetype or "unknown"
        return "Working on " .. ft .. " project"
      end,
      line_number_text    = "Line %s out of %s",
  })
  end,
}
