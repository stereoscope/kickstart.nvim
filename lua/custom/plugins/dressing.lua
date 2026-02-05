-- lua/custom/plugins/dressing.lua
return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  opts = {
    input = {
      enabled = true,
      relative = 'cursor',
      prefer_width = 40,
      max_width = { 140, 0.8 },
      min_width = { 20, 0.2 },
      win_options = { winblend = 10 },
    },
  },
}
