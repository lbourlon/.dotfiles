-- Highlight, edit, and navigate code
-- `:help nvim-treesitter`

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    {'nvim-treesitter/nvim-treesitter-textobjects'},
  },
  config = function()
    pcall(require('nvim-treesitter.install').update({ with_sync = true }))

    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'c', 'cpp', 'python', 'zig',
        'vim', 'vimdoc', 'query',
        'lua', 'luadoc', 'luap',
        'go', 'proto', 'bash', 'html',
        'rust', 'make', 'objdump'
      },
      auto_install = false,
      sync_install = false,
      ignore_install = {},
      modules = {},

      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },

      incremental_selection = { enable = false },
      textobjects = {

        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',

            ['ar'] = '@assignment.rhs',
            ['ir'] = '@assignment.rhs',
            ['al'] = '@assignment.lhs',
            ['il'] = '@assignment.lhs',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer', [']đ'] = '@function.outer',
            [']c'] = '@conditional.outer', [']¢'] = '@conditional.outer'
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',  ['[đ'] = '@function.outer',
            ['[c'] = '@conditional.outer', ['[¢'] = '@conditional.outer'
          },
          goto_next_end = { [']F'] = '@function.outer',  [']ª'] = '@function.outer'  },
          goto_previous_end = { ['[F'] = '@function.outer', ['[ª'] = '@function.outer' },
        },
      },
    })

  end,
}







