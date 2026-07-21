return {
  "olimorris/codecompanion.nvim",
  dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
      cmd = {
        adapter = "ollama",
      }
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "freehuntx/qwen3-coder:8b",
            }
          }
        })
      end,
    }
  },
  cconfig = function(_, opts)
    require("codecompanion").setup(opts)

    -- keymap
    vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat<CR>", { desc = "AI Chat" })
    vim.keymap.set("v", "<leader>aa", "<cmd>CodeCompanionAction<CR>", { desc = "AI Action" })
  end
}
