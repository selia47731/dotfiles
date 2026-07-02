return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  cmd = { "Oil" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "refractalize/oil-git-status.nvim",
  },
  keys = {
    {
      "<Leader>e",
      function()
        vim.cmd.Oil()
      end
    }
  },
  init = function()
    if vim.fn.argc() == 0 then
      return
    end

    local arg = vim.fn.argv(0)

    if vim.fn.isdirectory(arg) == 1 then
      vim.schedule(function()
        vim.cmd.Oil(arg)
      end)
    end
  end,

  opts = function()
    return {
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["<esc>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          local ignore_list = { ".DS_Store" }
          return vim.tbl_contains(ignore_list, name)
        end
      },
      use_default_keymaps = false,
      delete_to_trash = true,
      experimental_watch_for_changes = false,
      win_options = {
        signcolumn = "yes:2",
      }
    }
  end,
  config = function(_, opts)
    require("oil").setup(opts)
    require("oil-git-status").setup()
  end
}
