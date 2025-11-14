return {
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
    },
    config = function()
      local json_text = table.concat(vim.fn.readfile(vim.fn.expand("~/.skkeleton/azik_rule/azik_kana.json")), "\n")
      local azik_table = vim.fn.json_decode(json_text)
      vim.fn['skkeleton#register_kanatable']("azik", azik_table, true)
      vim.g['skkeleton#mapped_keys'] = vim.g['skkeleton#mapped_keys'] or {}
      table.insert(vim.g['skkeleton#mapped_keys'], "\\")
      table.insert(vim.g['skkeleton#mapped_keys'], "/")
      table.insert(vim.g['skkeleton#mapped_keys'], "<Space>")
      table.insert(vim.g['skkeleton#mapped_keys'], "<Esc>")
      vim.fn['skkeleton#register_keymap']("input", "\\", 'katakana')
      vim.fn['skkeleton#register_keymap']("input", "/", 'abbrev')
      vim.fn['skkeleton#register_keymap']("input", ";", 'henkanPoint')
      vim.fn['skkeleton#register_keymap']("henkan", "<Space>", 'henkanForward')
      vim.fn['skkeleton#register_keymap']("henkan", "<Esc>", 'cancel')

      vim.fn['skkeleton#config']{
        globalDictionaries = {
          "~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L",
        },
        userDictionary = "~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8",
        kanaTable = "azik",
        lowercaseMap = {
          ['+'] = ';',
        },
        keepState = true,
        immediatelyCancel = true,
        showCandidatesCount = 1,
      }

      vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-toggle)', {noremap = true})
      vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-toggle)', {noremap = true})
    end,
  },{
    "delphinus/skkeleton_indicator.nvim",
    after = "skkeleton",
    config = function()
      require("skkeleton_indicator").setup({})
    end,
  },
}
