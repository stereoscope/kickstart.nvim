-- lua/custom/plugins/toggleterm.lua
return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<C-\>]], -- Strg + \  → Terminal toggle
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        direction = 'horizontal', -- 'horizontal', 'vertical', 'float', 'tab'
        float_opts = { border = 'rounded' },
      }

      -- Python REPL (mit ipython – viel schöner als normaler python)
      local Terminal = require('toggleterm.terminal').Terminal

      local ipython = Terminal:new {
        cmd = 'ipython --no-confirm-exit',
        hidden = true,
        direction = 'horizontal',
      }

      vim.keymap.set('n', '<leader>tp', function() ipython:toggle() end, { desc = '[T]erminal: Python REPL (ipython)' })

      -- Normaler Terminal (falls du mal bash brauchst)
      vim.keymap.set('n', '<leader>tt', function() require('toggleterm').toggle(1, 20, nil, 'horizontal') end, { desc = '[T]erminal: Toggle Terminal' })
    end,
  },
}
