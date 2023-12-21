return {
  -- Detect tabstop and shiftwidth automatically
  {'tpope/vim-sleuth'},

  -- Shows pending keybinds actions
  { 'folke/which-key.nvim', opts = "" },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = "" },

  --, 
  { import = 'plugins.base'},
  { import = 'plugins.style'},
  { import = 'plugins.misc'},
  { import = 'plugins.is_directory'},

}
