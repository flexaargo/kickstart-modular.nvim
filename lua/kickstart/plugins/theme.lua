---@module 'lazy'
---@type LazySpec
return {
  {
    'gbprod/nord.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {},
    config = function (_, opts)
      require('nord').setup(opts)
      vim.cmd.colorscheme('nord')
    end
  },
}
-- vim: ts=2 sts=2 sw=2 et
