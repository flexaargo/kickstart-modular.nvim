return {
  {
    'Mathijs-Bakker/godotdev.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      formatter_cmd = { 'gdscript-formatter', '--use-spaces', '--indent-size', '2', '--reorder-code' },
    },
    config = function(_, opts)
      require('godotdev').setup(opts)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('custom-godot-indent', { clear = true }),
        pattern = 'gdscript',
        callback = function()
          vim.bo.expandtab = true
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
          vim.bo.tabstop = 2
        end,
      })
    end,
  },
}
