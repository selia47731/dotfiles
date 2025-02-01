return {
  "vim-skk/skkeleton",
  after = "denops.lua",
  dependencies = {
    "vim-denops/denops.vim",
    { "delphinus/skkeleton_indicator.nvim", opts = {} }
  },
  config = function()
    vim.cmd([[
      call skkeleton#config({
        \ 'sources': ['skk_dictionary'],
        \ 'globalKanaTableFiles': ['~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Settings/kana-rule.conf'],
        \ 'lowercaseMap': {
        \    '+': ';',
        \    ':': ';',
        \ },
        \ 'userDictionary': '~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8',
        \ })
    ]])
  end,
}
