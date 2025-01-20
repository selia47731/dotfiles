return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-ui-native",
      "Shougo/ddc-around",
      "Shougo/ddc-matcher_head",
      "Shougo/ddc-sorter_rank",
      "Shougo/ddc-source-copilot",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.cmd([[
        call ddc#custom#patch_global('ui', 'native')
        call ddc#custom#patch_global('sources', ['copilot','around'])
        call ddc#custom#patch_global('sourceOptions', {
	  \ '_': {
	  \   'matchers': ['matcher_head'],
	  \   'sorters': ['sorter_rank'],
          \ },
	  \ 'around': {
	  \   'mark': 'around'
	  \ },
    \ 'copilot': {
    \   'mark': 'Copilot',
    \   'minAutoCompleteLength': 0,
    \   'isVolatile': v:true
    \ },
	  \ })
        call ddc#enable()
      ]])
    end,
  },
}
