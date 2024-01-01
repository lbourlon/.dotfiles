return {
  -- Detect tabstop and shiftwidth automatically
  {'tpope/vim-sleuth'},

  -- Shows pending keybinds actions
  { 'folke/which-key.nvim', opts = "" },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
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
}
