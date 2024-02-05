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
        vim.keymap.set(mode, keys, func, {desc = 'GitS : ' .. desc })
      end

      map('n', '<leader>hs', gs.stage_hunk, "stage hunk")
      map('n', '<leader>hr', gs.reset_hunk, "reset hunk")
      map('v', '<leader>hs',
        function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end,
        "stage highlighted")
      map('v', '<leader>hr',
        function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end,
        "reset highlighted")

      map('n', '<leader>hu', gs.undo_stage_hunk, "undo stage")
      map('n', '<leader>htd', gs.toggle_deleted, "toggle deleted")
      map('n', '<leader>hth', ':Gitsigns togle_linehl', "toggle highlight")

      -- map('n', '<leader>hS', gs.stage_buffer, "Stage Buffer")
      -- map('n', '<leader>hR', gs.reset_buffer)

      -- map('n', '<leader>hd', gs.diffthis, "diff this")
      -- map('n', '<leader>hp', gs.preview_hunk, "hunk preview")
      -- map('n', '<leader>hbt', gs.toggle_current_line_blame, "git blame toggle")

    end
  },
}
