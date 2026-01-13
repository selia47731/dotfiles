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
        local lang vim.treesitter.language.get_lang(ft)
        if not lang then
          return
        end

        -- すでにインストールされている場合はスキップ
        if vim.treesitter.language.get_parser(nil, lang) then
          return
        end

        ts.install({ lang })

        pcall(vim.treesitter.start, event.buf)

        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
