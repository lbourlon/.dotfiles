return {
  -- Detect tabstop and shiftwidth automatically
  {'tpope/vim-sleuth', commit="1cc4557"},

  -- Shows pending keybinds actions
  { 'folke/which-key.nvim', commits = "4433e5e" },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    commit="6c921ca",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', commit = "0236521" },

  --, 
  { import = 'plugins.base'},
  { import = 'plugins.style'},
  { import = 'plugins.misc'},
  { import = 'plugins.is_directory'},
  { import = 'plugins.lazy_loaded'}

}
