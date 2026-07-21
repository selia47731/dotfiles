return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  init = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter")
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        local ft = vim.bo[event.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
          return
        end

        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        if pcall(vim.treesitter.language.add, lang) then
          pcall(vim.treesitter.start, event.buf)
          return
        end

        ts.install({ lang }, function()
          vim.schedule(function()
            pcall(vim.treesitter.start, event.buf)
          end)
        end)
      end,
    })
  end,
}
