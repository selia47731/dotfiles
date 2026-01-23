return {
  "Shougo/ddc.vim",
  after = "copilot.lua",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddc-ui-native",
    "Shougo/ddc-source-around",
    "Shougo/ddc-source-lsp",
    "Shougo/ddc-source-copilot",
    "Shougo/ddc-buffer",
    "Shougo/ddc-filter-matcher_head",
    "Shougo/ddc-filter-sorter_rank",
    "Shougo/ddc-filter-converter_remove_overlap",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "zbirenbaum/copilot.lua",
    "vim-skk/skkeleton",
  },
  config = function()
    vim.fn["ddc#custom#patch_global"]('ui', 'native')
    vim.fn["ddc#custom#patch_global"]('sources', { 'lsp', 'around', 'copilot', 'buffer', 'skkeleton' })
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
      copilot = {
        mark = 'copilot',
        matchers = {},
        minAutoCompleteLength = 1,
        isVolatile = true,
      },
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
      copilot = {
        copilot = 'lua',
      },
      buffer = {
        requireSameFiletype = true,
        limitAltBuf = true,
        forceCollect = true,
      },
    })
    vim.keymap.set('i', "<Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-n>"
      elseif vim.snippet and vim.snippet.active({ direction = 1 }) then
        return vim.snippet.jump(1)
      else
        return "<Tab>"
      end
    end, {expr = true, silent = true})

    vim.keymap.set('i', "<S-Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-p>"
      elseif vim.snippet and vim.snippet.active({ direction = -1 }) then
        return vim.snippet.jump(-1)
      else
        return "<S-Tab>"
      end
    end, {expr = true, silent = true})

    vim.fn["ddc#enable"]()
  end,
}
