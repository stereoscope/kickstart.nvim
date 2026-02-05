-- lua/custom/plugins/ai.lua
-- avante.nvim + xAI Grok (Grok-4 / Grok-4.1 Fast) – 2026 State-of-the-Art
return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- immer die neueste
    build = 'make', -- für das Rust-Binary (schneller Fuzzy-Matcher)

    opts = {
      -- Default Provider = xAI
      provider = 'xai',

      -- Auto-Suggestions (wie Copilot) – auch mit Grok
      auto_suggestions_provider = 'xai',

      -- Hier die echte xAI-Konfig (OpenAI-kompatibel)
      providers = {
        xai = {
          __inherited_from = 'openai', -- erbt alle OpenAI-Features
          endpoint = 'https://api.x.ai/v1',
          model = 'grok-4', -- ← starkes Reasoning/Coding-Modell
          -- model = 'grok-4-1-fast-reasoning', -- Alternative: schneller + top Tool-Calling (Agentic)
          api_key_name = 'XAI_API_KEY', -- liest automatisch aus ENV
          -- extra_request_body = { temperature = 0.7, max_tokens = 4096 }, -- optional
        },
      },

      -- Verhalten (sehr gut für Coding)
      behaviour = {
        auto_suggestions = true, -- zeigt Vorschläge inline
        auto_apply_diff = true, -- übernimmt Änderungen automatisch bei /apply
        support_paste_from_clipboard = true,
      },

      -- Keymaps (du kannst sie ändern)
      mappings = {
        ask = '<leader>aa', -- Chat öffnen + Frage stellen
        edit = '<leader>ae', -- markierten Code umschreiben/refactoren
        refresh = '<leader>ar',
        focus = '<leader>af',
        -- /apply, /diff, /fix etc. funktionieren automatisch im Chat
      },

      windows = {
        width = 45, -- Sidebar-Breite
        sidebar_header = { rounded = true },
      },

      -- Optional: bessere Hints für Grok
      hints = { enabled = true },
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
