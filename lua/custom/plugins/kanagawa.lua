-- lua/custom/plugins/kanagawa.lua
return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- muss als erstes Theme geladen werden
    config = function()
      require('kanagawa').setup {
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- true = Hintergrund transparent
        dimInactive = false,
        terminalColors = true,
        theme = 'wave', -- wave (default), dragon, lotus
        background = {
          dark = 'wave',
          light = 'lotus',
        },
        colors = {
          theme = {
            all = {
              ui = { bg_gutter = 'none' },
            },
          },
        },
      }

      -- Lade das Theme
      vim.cmd.colorscheme 'kanagawa-wave' -- oder 'kanagawa-dragon' oder 'kanagawa-lotus'
    end,
  },
}
