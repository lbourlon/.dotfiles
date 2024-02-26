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

      local map = function(mode, keys, func, xeesc)
        vim.keymap.set(mode, keys, func, {desc = '[G]it ' .. xeesc })
      end

      local vfl = vim.fn.line
      map('n', '<leader>gs', gs.stage_hunk, "[S]tage hunk")
      map('n', '<leader>gr', gs.reset_hunk, "[R]eset hunk")
      map('v', '<leader>gs', function() gs.stage_hunk({vfl('.'), vfl('v')}) end, "[S]tage hunk")
      map('v', '<leader>gr', function() gs.reset_hunk({vfl('.'), vfl('v')}) end, "[R]eset hunk")

      map('n', '<leader>gu', gs.undo_stage_hunk, "[U]ndo stage")
      map('n', '<leader>gtd', gs.toggle_deleted, "[T]oggle deleted")
      map('n', '<leader>gth', ':Gitsigns toggle_linehl<CR>', "[T]oggle highlight")

      map('n', '<leader>gS', gs.stage_buffer, "[S]tage Buffer")
      map('n', '<leader>gR', gs.reset_buffer, "[R]eset Buffer")

      -- map('n', '<leader>hd', gs.diffthis, "diff this")
      -- map('n', '<leader>hp', gs.preview_hunk, "hunk preview")
      -- map('n', '<leader>hp', ":Gitsigns setqflist<CR>", "hunk preview")
      map('n', '[g', ":Gitsigns prev_hunk<CR>", "Previous Hunk")
      map('n', ']g', ":Gitsigns next_hunk<CR>", "Next Hunk")

    end
  },
}
