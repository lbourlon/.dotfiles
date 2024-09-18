return {
  -- Git Goodies
  {'tpope/vim-fugitive'},
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  {
    -- See `:help gitsigns.txt`
    'lewis6991/gitsigns.nvim',
    config = function()
      local gs = require('gitsigns')

      gs.setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = 'x' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })

      local map = function(mode, keys, func, desc)
        vim.keymap.set(mode, keys, func, {desc = '[G]it ' .. desc })
      end

      local vfl = vim.fn.line
      map('n', '<leader>ga', gs.stage_hunk, "[G]it [A]dd hunk")
      map('n', '<leader>gr', gs.reset_hunk, "[G]it [R]eset hunk")
      map('v', '<leader>ga', function() gs.stage_hunk({vfl('.'), vfl('v')}) end, "[A]add hunk")
      map('v', '<leader>gr', function() gs.reset_hunk({vfl('.'), vfl('v')}) end, "[R]eset hunk")

      map('n', '<leader>gu', gs.undo_stage_hunk, "[U]ndo stage")
      map('n', '<leader>gtd', gs.toggle_deleted, "[T]oggle deleted")
      map('n', '<leader>gth', ':Gitsigns toggle_linehl<CR>', "[T]oggle highlight")

      map('n', '<leader>gA', gs.stage_buffer, "[A]dd Buffer")
      map('n', '<leader>gR', gs.reset_buffer, "[R]eset Buffer")

      map('n', '<leader>gd', gs.diffthis, "[G]it [D]iff this")
      map('n', '<leader>gp', gs.preview_hunk, "hunk preview")
      -- map('n', '<leader>hp', ":Gitsigns setqflist<CR>", "hunk preview")
      map('n', '[g', ":Gitsigns prev_hunk<CR>", "Previous Hunk")
      map('n', ']g', ":Gitsigns next_hunk<CR>", "Next Hunk")

    end
  },
}
