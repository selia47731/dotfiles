return {
  "Shougo/ddc.vim",
  after = "copilot.lua",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddc-ui-native",
    "Shougo/ddc-source-around",
    "Shougo/ddc-source-lsp",
    "Shougo/ddc-buffer",
    "Shougo/ddc-filter-matcher_head",
    "Shougo/ddc-filter-sorter_rank",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local capabilities = require("ddc_source_lsp").make_client_capabilities()
    require("lspconfig").denols.setup({
      capabilities = capabilities,
    })
    vim.cmd([[
      call ddc#custom#patch_global('ui', 'native')
      call ddc#custom#patch_global('sources', ['lsp', 'around', 'buffer'])
      call ddc#custom#patch_global('sourceOptions', #{
        \ _: #{
        \   matchers: ['matcher_head'],
        \   sorters: ['sorter_rank'],
        \ },
        \ lsp: #{
        \   mark: 'lsp',
        \   forceCompletionPattern: '\.\w*|:\w*|->\w*',
        \ },
        \ around: #{ mark: 'around' },
        \ buffer: #{ mark: 'buffer' },
        \ })
      call ddc#custom#patch_global('sourceParams', #{
        \ lsp: #{
        \   snippetEngine: denops#callback#register({
        \     body -> vsnip#anonymous(body)
        \   }),
        \   enableResolveItem: v:true,
        \   enableAdditionalTextEdits: v:true,
        \ },
        \ around: #{ maxSize: 500 },
        \ buffer: #{
        \ requireSameFiletype: v:true,
        \ limitAltBuf: v:true,
        \ forceCollect: v:true,
        \ },
        \ })

      call ddc#enable()
    ]])
  end,
}
