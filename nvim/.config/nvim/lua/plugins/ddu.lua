return {
  "Shougo/ddu.vim",
  after = "denops.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-kind-file",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-source-rg",
    "Shougo/ddu-filter-matcher_substring",
    "uga-rosa/ddu-filter-converter_devicon",
    "lambdalisue/kensaku.vim",
    "Milly/ddu-filter-kensaku",
  },
  config = function()
    vim.cmd[[
      call ddu#custom#patch_global(#{
        \   ui: 'ff',
        \   _: #{
        \     matters: [ 'matcher_kensaku' ],
        \   },
        \   uiParams: #{
        \     ff: #{
        \       split: 'floating',
        \     },
        \   },
        \   sources: [#{ name: 'file_rec' }],
        \   sourceOptions: #{
        \     _: #{
        \       matchers: [ 'matcher_substring' ],
        \     },
        \     file_rec: #{
        \       matchers: [ 'matcher_substring', 'macher_kensaku' ],
        \       converters: [ 'converter_devicon' ],
        \       path: expand("~"),
        \     },
        \   },
        \   sourceParams: #{
        \     rg: #{
        \       args: ['--column', '--no-heading', '--color', 'never'],
        \     },
        \   },
        \   kindOptions: #{
        \     file: #{
        \       defaultAction: 'open',
        \     },
        \   },
        \   filtersParams: #{
        \     macher_kensaku: #{
        \       hightlightMatched: 'Search',
        \     },
        \   },
        \ })
    ]]
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff",
      callback = function()
        local opts = { noremap =true, silent =true, buffer = true }
        vim.keymap.set("n", "<CR>", [[<cmd>call ddu#ui#ff#do_action('itemAction')<CR>]], opts)
        vim.keymap.set("n", "<Space>", [[<cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>]], opts)
        vim.keymap.set("n", "i", [[<cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>]], opts)
        vim.keymap.set("n", "q", [[<cmd>call ddu#ui#ff#do_action('quit')<CR>]], opts)
      end,
    })
  end,
}
