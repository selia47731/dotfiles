return{
  'nvim-lualine/lualine.nvim',
  after = 'sakura.lua',
  event = 'BufEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    -- oilでのファイル名対応(相対path表示)
    local function fmt_filename(str)
      local path = str:gsub('^oil://', '')

      local cwd = vim.fn.getcwd()
      if vim.startswith(path, cwd) then
        local rel = path:sub(#cwd + 2)
        return rel ~= '' and rel or '.'
      end

      local home = vim.fn.expand('~')
      if vim.startswith(path, home) then
        return '.' .. path:sub(#home + 1)
      end

      return path
    end

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},

        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 2,
            fmt = fmt_filename
          },
        },
        lualine_x = {'diagnostics','encoding','filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 2,
            fmt = fmt_filename
          },
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {fugitive},
  })
  end
}
