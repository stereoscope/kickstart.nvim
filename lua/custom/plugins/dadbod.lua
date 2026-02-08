-- lua/custom/plugins/dadbod.lua
return {
  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    keys = {
      { '<leader>D', '<cmd>DBUIToggle<CR>', desc = 'Dadbod UI öffnen' },
    },
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true }, -- wird automatisch mitgeladen
      { 'kristijanhusak/vim-dadbod-completion', lazy = true }, -- nur für SQL-Dateien
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui'

      vim.g.dbs = {
        playground = 'postgresql://dba:Hsek3ylv0IUPbBBLpWM1@localhost:5432/playground',
        odoo_19 = 'postgresql://dba:Hsek3ylv0IUPbBBLpWM1@localhost:5432/odoo_19',

        -- prod = 'postgresql://user:pass@prod-host:5432/prod_db',
      }
    end,
  },
}
