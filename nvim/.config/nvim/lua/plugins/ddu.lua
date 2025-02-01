return {
  "Shougo/ddu.vim",
  after = "denops.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-filter-matcher_substring",
    "Shougo/ddu-kind-file",
  },
  config = function()
    vim.cmd[[
      call ddu#custom#patch_global(#{
        \   ui: 'ff',
        \   sources: [#{name: 'file_rec', params: {}}],
        \   sourceOptions: #{
        \     _: #{
        \       matchers: ['matcher_substring'],
        \     },
        \   },
        \   kindOptions: #{
        \     file: #{
        \       defaultAction: 'open',
        \     },
        \   }
        \ })
    ]]
  end,
}
