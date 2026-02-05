-- lua/custom/plugins/completion.lua
return {
  {
    'saghen/blink.cmp',
    opts = {
      -- Automatisch Popup beim Tippen (VSCode-Style)
      completion = {
        menu = { auto_show = true },
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        list = {
          selection = {
            preselect = true, -- erstes Item ist schon markiert
            auto_insert = true, -- Tab/Enter fügt direkt ein
          },
        },
      },

      -- Noch mehr Quellen (Wörter aus anderen Dateien + Puffer)
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod' },
        providers = {
          dadbod = {
            name = 'Dadbod',
            module = 'vim_dadbod_completion.blink',
          },
        },
        per_filetype = {
          sql = { 'lsp', 'dadbod', 'buffer', 'snippets' },
        },
      },
      -- Keymaps (optional, aber sehr praktisch)
      keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      },
    },
  },
}
