return {
  -- Detect tabstop and shiftwidth automatically
  {'tpope/vim-sleuth'},

  -- Shows pending keybinds actions
  {
    'folke/which-key.nvim',
    cmd = "Which", --lazyload
    -- event = 'VeryLazy',
    config = function()
      require("which-key").setup {
        plugins = {
          marks = false,
          registers = false,
          spelling = { enabled = false },
        }}
      require('which-key').register {
        ['<leader>g'] =  { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>c'] =  { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>p'] =  { name = '[P]ane', _ = 'which_key_ignore' },
        ['<leader>s'] =  { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>sr'] = { name = '[S]earch [R]eplace', _ = 'which_key_ignore' },
      }
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = "" },

  -- Toggle collors hexcolors
  -- {'norcalli/nvim-colorizer.lua', commit='36c610a9717cc9ec426a07c8e6bf3b3abcb139d6'}

  { import = 'plugins.base'},
  { import = 'plugins.style'},
  { import = 'plugins.misc'},
}
