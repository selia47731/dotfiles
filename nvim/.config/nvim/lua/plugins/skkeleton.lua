return {
  "vim-skk/skkeleton",
  after = "denops.lua",
  dependencies = {
    "vim-denops/denops.vim",
    { "delphinus/skkeleton_indicator.nvim", opts = {} }
  },
  config = function()
    local json_text = table.concat(vim.fn.readfile(vim.fn.expand("~/.skkeleton/azik_rule/azik_kana.json")), "\n")
    local azik_table = vim.fn.json_decode(json_text)
    vim.fn['skkeleton#register_kanatable']("azik", azik_table, true)
    vim.fn['skkeleton#config']{
      globalDictionaries = {
        "~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L",
      },
      kanaTable = "azik",
      lowercaseMap = {
        ['+'] = ';',
      },
    }
    vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-toggle)', { noremap = false })
  end,
}
