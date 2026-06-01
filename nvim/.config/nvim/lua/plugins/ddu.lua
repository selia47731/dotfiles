return {
  "Shougo/ddu.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-kind-file",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-source-rg",
    "Shougo/ddu-filter-matcher_substring",
    "uga-rosa/ddu-filter-converter_devicon",
    "lambdalisue/vim-kensaku",
    "Milly/ddu-filter-kensaku",
  },
  config = function()
    vim.fn["ddu#custom#patch_global"]({
      ui = 'ff',
      sourceOptions = {
        _ = {
          matchers = { 'matcher_substring' }
        }
      }
    })

    -- file picker
    vim.fn["ddu#custom#patch_local"]('files', {
      uiParams = {
        ff = {
          split = 'floating'
        }
      },
      sources = {
        { name = "file_rec" }
      },
      sourceOptions = {
        file_rec = {
          converters = { 'converter_devicon' },
          path = vim.fn.expand("~")
        }
      },
      sourceParams = {
        rg = {
          args = { '--column', '--no-heading', '--color', 'never' }
        }
      },
      kindOptions = {
        file = {
          defaultAction = 'open'
        }
      }
    })

    -- kensaku
    vim.fn["ddu#custom#patch_local"]('kensaku', {
      uiParams = {
        ff = {
          split = 'vertical'
        }
      },
      sources = {
        { name = 'line' }
      },
      sourceOptions = {
        line = {
          matchers = { 'matcher_kensaku' }
        }
      },
      filterParams = {
        matcher_kensaku = {
          highlightMatched = 'Special'
        }
      }
    })

    --@param name string
    local function ddu(name)
      vim.fn["ddu#start"]({
        name = name,
      })
    end

    vim.keymap.set("n", "<Leader>f", function()
      ddu("files")
    end)

    vim.keymap.set("n", "<Leader>k", function()
      ddu("kensaku")
    end)


    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff",
      callback = function(ev)
        local opts = { noremap =true, silent =true, buffer = ev.buf }
        vim.keymap.set("n", "<CR>", [[<cmd>call ddu#ui#ff#do_action('itemAction')<CR>]], opts)
        vim.keymap.set("n", "<Space>", [[<cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>]], opts)
        vim.keymap.set("n", "i", [[<cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>]], opts)
        vim.keymap.set("n", "q", [[<cmd>call ddu#ui#ff#do_action('quit')<CR>]], opts)
      end,
    })
  end,
}
