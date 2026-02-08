--- lua/custom/plugins/alpha.lua
return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
    -- █                 GEILER KANAGAWA-WAVE HEADER                       █
    -- █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█

    dashboard.section.header.val = {
      '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    }

    -- Buttons (dein Workflow)
    dashboard.section.buttons.val = {
      dashboard.button('f', '󰈞  Datei finden', ':Telescope find_files<CR>'),
      dashboard.button('r', '󰄉  Zuletzt geöffnet', ':Telescope oldfiles<CR>'),
      dashboard.button('e', '  Neue Datei', ':ene | startinsert<CR>'),
      dashboard.button('s', '  Einstellungen', ':e ~/.config/nvim/init.lua<CR>'),
      dashboard.button('l', '󰒲  Lazy Sync', ':Lazy sync<CR>'),
      dashboard.button('m', '󰏓  Mason', ':Mason<CR>'),
      dashboard.button('a', '󰚩  Grok AI Chat', ':AvanteAsk<CR>'),
      dashboard.button('d', '󰆼  Dadbod UI', ':DBUIToggle<CR>'),
      dashboard.button('t', '󰆍  Terminal', ':ToggleTerm<CR>'),
      dashboard.button('q', '󰅚  Beenden', ':qa<CR>'),
    }

    -- Footer: täglich wechselndes Zitat
    local fortune = {
      '„Code is like humor. When you have to explain it, it’s bad.“',
      '„Debugging is twice as hard as writing the code in the first place.“',
      '„First, solve the problem. Then, write the code.“',
      '„Any fool can write code that a computer can understand. Good programmers write code that humans can understand.“',
      '„Odoo ist kein Bug, es ist ein Feature.“',
    }
    dashboard.section.footer.val = fortune[math.random(#fortune)]

    -- Kanagawa-Farben
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'
    dashboard.section.footer.opts.hl = 'Comment'

    -- Layout-Feinschliff
    dashboard.config.layout[1] = { type = 'padding', val = 4 }
    dashboard.config.layout[3] = { type = 'padding', val = 2 }

    alpha.setup(dashboard.config)

    -- Dashboard jederzeit manuell öffnen
    vim.keymap.set('n', '<leader>H', ':Alpha<CR>', { desc = 'Dashboard öffnen' })

    -- Kleiner Fix: kein Folding auf dem Dashboard
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'alpha',
      callback = function() vim.opt_local.foldenable = false end,
    })
  end,
}
