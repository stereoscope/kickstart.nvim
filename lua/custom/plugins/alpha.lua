-- lua/custom/plugins/alpha.lua
return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- 1. Cooler Header (größer + Kanagawa-Vibes)
    dashboard.section.header.val = {
      '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    }
    -- 2. Buttons (deutsch + direkt deine wichtigsten Shortcuts)
    dashboard.section.buttons.val = {
      dashboard.button('f', '󰈞  Datei finden', ':Telescope find_files<CR>'),
      dashboard.button('r', '󰄉  Zuletzt geöffnet', ':Telescope oldfiles<CR>'),
      dashboard.button('e', '  Neue Datei', ':ene | startinsert<CR>'),
      dashboard.button('s', '  Einstellungen', ':e ~/.config/nvim/init.lua<CR>'),
      dashboard.button('l', '󰒲  Lazy Sync', ':Lazy sync<CR>'),
      dashboard.button('m', '󰏓  Mason', ':Mason<CR>'),
      dashboard.button('a', '󰚩  Grok AI Chat', ':AvanteAsk<CR>'), -- dein avante
      dashboard.button('d', '󰆼  Dadbod UI', ':DBUIToggle<CR>'),
      dashboard.button('t', '󰆍  Terminal', ':ToggleTerm<CR>'),
      dashboard.button('q', '󰅚  Beenden', ':qa<CR>'),
    }

    -- 3. Footer mit random motivierendem Zitat (kein extra Plugin nötig!)
    local fortune = {
      '„Code is like humor. When you have to explain it, it’s bad.“',
      '„Debugging is twice as hard as writing the code in the first place.“',
      '„First, solve the problem. Then, write the code.“ – John Johnson',
      '„Programs must be written for people to read, and only incidentally for machines to execute.“',
      '„Any fool can write code that a computer can understand. Good programmers write code that humans can understand.“',
      '„Odoo ist kein Bug, es ist ein Feature.“ – du morgen',
    }
    dashboard.section.footer.val = fortune[math.random(#fortune)]

    -- 4. Kanagawa-spezifische Farben (passt perfekt zu deinem Theme)
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'
    dashboard.section.footer.opts.hl = 'Comment'

    -- 5. Layout-Feinschliff
    dashboard.config.layout[1] = { type = 'padding', val = 3 } -- oben mehr Platz
    dashboard.config.layout[3] = { type = 'padding', val = 2 } -- zwischen Header und Buttons

    -- 6. Alpha starten + kleine Extras
    alpha.setup(dashboard.config)

    -- Kein Folding auf dem Dashboard
    vim.cmd [[ autocmd FileType alpha setlocal nofoldenable ]]
  end,
}
