-- lua/custom/plugins/python.lua
-- Alles für Python-Entwicklung: LSP, Linter, Formatter, Debugger

return {
  -- venv automatisch erkennen und wechseln (aktuellster Branch)
  {
    'linux-cultist/venv-selector.nvim',
    -- branch = 'regexp' ← weg, jetzt wieder main
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('venv-selector').setup {
        parents = 0,
        auto_refresh = true,
      }
      vim.keymap.set('n', '<leader>vs', '<cmd>VenvSelect<CR>', { desc = 'Select Python Venv' })
    end,
  },

  -- 4. Debugger
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local dap_python = require 'dap-python'

      dapui.setup()
      dap_python.setup(vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python')

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: [C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step [I]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step [O]ver' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Debug: Step [O]ut' })
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle [U]I' })

      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
    end,
  },
}
