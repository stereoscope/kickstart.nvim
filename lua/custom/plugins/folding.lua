-- lua/custom/plugins/folding.lua
return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype) return { 'treesitter', 'indent' } end,

        -- WICHTIG: Kein automatisches Zuklappen beim Öffnen/Einfügen
        open_fold_hl_timeout = 0,
        close_fold_kinds_for_ft = {
          default = {}, -- nichts automatisch zuklappen
          python = {},
          xml = {},
        },
      }

      vim.o.foldlevelstart = 99
      vim.o.foldlevel = 99

      -- Keymaps bleiben gleich
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
      vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
    end,
  },
}
