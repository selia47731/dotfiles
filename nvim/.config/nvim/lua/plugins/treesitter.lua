return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  init = function()
    require("nvim-treesitter").setup({
        install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter"),
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        local ok, nvim_treesitter = pcall(require, "nvim-treesitter")
        if not ok then return end
        local filetype = vim.bo[event.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype)
        nvim_treesitter.install({lang}):await(function(err)
          if err then
            vim.notify('Treesitter install error for filetype' .. filetype .. ' err: ' .. err)
            return
          end
          pcall(vim.treesitter.start, event.buf)
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end)
      end,
    })
  end,
}
