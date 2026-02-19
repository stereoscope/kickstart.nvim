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

      local claude = Terminal:new {
        cmd = 'claude',
        hidden = true,
        direction = 'float',
        float_opts = {
          border = 'rounded',
          width = function() return math.floor(vim.o.columns * 0.75) end,
          height = function() return math.floor(vim.o.lines * 0.60) end,
        },
      }

      vim.keymap.set('n', '<leader>tp', function() ipython:toggle() end, { desc = '[T]erminal: Python REPL (ipython)' })
      vim.keymap.set('n', '<leader>tc', function() claude:toggle() end, { desc = '[T]erminal: Claude Code' })

      -- Normaler Terminal (falls du mal bash brauchst)
      vim.keymap.set('n', '<leader>tt', function() require('toggleterm').toggle(1, 20, nil, 'horizontal') end, { desc = '[T]erminal: Toggle Terminal' })

      -- Terminal-Mode: Fenster-Navigation ohne Terminal zu schließen
      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Fenster links' })
      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = 'Fenster unten' })
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Fenster oben' })
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = 'Fenster rechts' })
      vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Terminal-Mode verlassen' })
    end,
  },
}
