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
  config = function(_, opts)
    local jupytext = require("jupytext")

    function jupytext.get_new_template(filepath)
      if not filepath or not filepath:match("%.ipynnb$") then
        return nil
      end
      if filepath and vim.fn.filereadable(filepath) == 1 and vim.fn.getfsize(filepath) > 0 then
        return nil
      end

      local template_path = vim.fn.stdpath("data") .. "/lazy/jupytext.nvim/data/template.ipynb"
      local f = io.open(template_path, "r")
      if f then
        local content = f:read("*a")
        f:close()
        return content
      else
        vim.notify("Jupytext template not found at " .. template_path, vim.log.levels.WARN)
        return [[
{
"cells": [],
"metadeta": {},
"nbformat": 4,
"nbformat_minor": 5
}
]]
      end
    end


    vim.api.nvim_create_autocmd("BufNewFile", {
      pattern = "*.ipynb",
      callback = function(args)
        local path = args.file
        if vim.fn.getfsize(path) == 0 then
          local template = jupytext.get_new_template(path)
          if template ~= nil then
            vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, vim.split(template, "\n"))
          end
        end
      end,
      })
  end
}
