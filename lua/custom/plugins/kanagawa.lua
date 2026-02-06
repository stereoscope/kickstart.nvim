-- lua/custom/plugins/kanagawa.lua
return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        transparent = true,
        dimInactive = true,
        compile = true, -- einmalig `:KanagawaCompile` ausführen!
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},

        terminalColors = true,

        -- Welche Variante soll standardmäßig geladen werden?
        theme = 'wave', -- 'wave' (warm), 'dragon' (dunkel), 'lotus' (hell)

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

        -- Floating Windows schön machen
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = theme.ui.bg_m3 },
            FloatBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
            TelescopeBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
            TelescopePromptBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
          }
        end,
      }

      -- Jetzt das Theme wirklich laden
      vim.cmd.colorscheme 'kanagawa-wave' -- oder 'kanagawa-dragon' / 'kanagawa-lotus'
    end,
  },
}
