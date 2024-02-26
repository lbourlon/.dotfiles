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
      ensure_installed = {'c', 'lua','python', 'zig'},
      auto_install = false,
      sync_install = false,
      ignore_install = {},
      modules = {},

      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Leader>oo',
          node_incremental = '<Leader>op',
          scope_incremental = '<Leader>os',
          node_decremental = '<Leader>om',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { [']f'] = '@function.outer' },
          -- goto_next_end = { [']F'] = '@function.outer' },
          goto_previous_start = { ['[f'] = '@function.outer' },
          -- goto_previous_end = { ['[F'] = '@function.outer' },
        },
      },
    })

  end,
}







