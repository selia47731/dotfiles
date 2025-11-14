return {
  'nekowasabi/hellshake-yano.vim',
  dependencies = { 'vim-denops/denops.vim' },
  config = function()
    vim.g.hellshake_yano = {
      useJapanese = true,
      useTinySegmenter = true,
      perKeyMotionCount = {
        v = 1,
        V = 1,
        w = 1,
        b = 1,
        e = 1,
        h = 2,
        j = 2,
        k = 2,
        l = 2,
        f = 3,
        F = 3,
      },
      perKeyMinLength = {
        v = 1,
        w = 3,
        e = 3,
      },
      enableHighlight = true,
      cacheSize = 2000,
      maxHints = 50,

    }
  end,
}
