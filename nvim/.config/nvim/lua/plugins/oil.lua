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
    local oilPathPatterns = { "oil://", "oil-ssh://", "oil-trash://" }
    local path = vim.fn.expand("%:p")

    local isDir = vim.fn.isdirectory(path)
    local isOilPath = vim.iter(oilPathPatterns):any(function(opp)
      return (string.find(path, opp, 1, true)) ~= nil
    end)
    if isDir or isOilPath then
      vim.cmd.Oil()
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
