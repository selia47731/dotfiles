return {
  "cohama/lexima.vim",
  config = function()
    vim.g.lexima_no_default_rules = true
    vim.g.lexima_no_space_error = true
    vim.g.lexima_enable_newline_rules = false
    vim.g.lexima_enable_endwise_rules = false
    vim.g.lexima_enable_conceal = true
    vim.g.lexima_enable_basic_rules = true
    vim.g.lexima_enable_surround = true
    vim.g.lexima_enable_autoclose = true
    vim.g.lexima_enable_snippet = true
    vim.g.lexima_enable_comment = true
    vim.g.lexima_enable_formatting = true
    vim.g.lexima_enable_search = true
    vim.g.lexima_enable_tab = true
    vim.g.lexima_enable_vim_line_break = true
    vim.g.lexima_enable_vim_cursor = true
    vim.g.lexima_enable_vim_omni = true
  end,
}
