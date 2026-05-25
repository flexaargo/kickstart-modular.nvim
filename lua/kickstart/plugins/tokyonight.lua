---@module 'lazy'
---@type LazySpec
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      flavour = 'mocha',
    },
    config = function (_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et
