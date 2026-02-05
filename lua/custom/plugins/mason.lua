-- lua/custom/plugins/mason.lua
return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'pyright',
        'ruff',
        'debugpy',
        'lua-language-server',
        'stylua',
        'odoo-ls', -- dein Odoo-LSP
        'sqlfluff', -- optional
      },
    },
  },
}
