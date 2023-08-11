return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },


  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },


  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  --    https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/completion.lua
  --    https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/plugin/options.lua
  --    https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim/after/plugin
  --    https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/autoformat.lua
  --, 
  { import = 'plugins.base'},
  { import = 'plugins.style'},
  { import = 'plugins.misc'},
  { import = 'plugins.is_directory'},
  { import = 'plugins.lazy_loaded'}

}
