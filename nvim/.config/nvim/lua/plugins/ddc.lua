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
    "Shougo/ddc-filter-converter_remove_overlap",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "vim-skk/skkeleton",
  },
  config = function()
    vim.fn["ddc#custom#patch_global"]('ui', 'native')
    vim.fn["ddc#custom#patch_global"]('sources', { 'lsp', 'around', 'buffer', 'skkeleton' })
    vim.fn["ddc#custom#patch_global"]('sourceOptions', {
      _ = {
        matchers = { 'matcher_head' },
        sorters = { 'sorter_rank' },
        converters = { 'converter_remove_overlap' },
      },
      lsp = {
        mark = 'lsp',
        forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
      },
      around = { mark = 'around' },
      buffer = { mark = 'buffer' },
      skkeleton = {
        mark = 'skkeleton',
        matchers = {},
        sorters = {},
        converters = {},
        isVolatile = true,
        minAutoCompleteLength = 1,
      },
    })
    vim.fn["ddc#custom#patch_global"]('sourceParams', {
      lsp = {
        snippetEngine = function(body)
          return vim.fn["vsnip#anonymous"](body)
        end,
        enableResolveItem = true,
        enableAdditionalTextEdits = true,
      },
      around = { maxSize = 500 },
      buffer = {
        requireSameFiletype = true,
        limitAltBuf = true,
        forceCollect = true,
      },
    })
    vim.fn["ddc#enable"]()
  end,
}
