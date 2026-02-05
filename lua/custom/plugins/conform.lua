-- lua/custom/plugins/format.lua
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      { '<leader>f', function() require('conform').format { async = true, lsp_format = 'fallback' } end, mode = '', desc = '[F]ormat buffer' },
    },
    opts = {
      notify_on_error = false,
      format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_fix', 'ruff_format' },
        sql = { 'sqlfluff' }, -- falls du magst
      },
      formatters = {
        ruff_fix = { command = 'ruff', args = { 'check', '--fix', '--select', 'I', '--force-exclude' } },
      },
    },
  },
}
