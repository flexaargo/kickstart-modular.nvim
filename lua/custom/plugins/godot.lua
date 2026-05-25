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
      vim.treesitter.language.register('gdscript', { 'gd', 'gdscript3' })

      require('godotdev').setup(opts)

      local function set_godot_highlights()
        vim.api.nvim_set_hl(0, 'GodotComment', { link = 'Comment' })
        vim.api.nvim_set_hl(0, '@comment.gdscript', { link = 'Comment' })
        vim.api.nvim_set_hl(0, '@lsp.type.comment.gdscript', { link = 'Comment' })
      end

      set_godot_highlights()

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom-godot-highlights', { clear = true }),
        callback = set_godot_highlights,
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('custom-godot-indent', { clear = true }),
        pattern = { 'gd', 'gdscript', 'gdscript3' },
        callback = function()
          vim.bo.expandtab = true
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
          vim.bo.tabstop = 2
          vim.cmd [[syntax match GodotComment "#.*$" containedin=ALL]]
        end,
      })
    end,
  },
}
