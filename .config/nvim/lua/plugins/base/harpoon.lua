return {
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' }
  },

  lazy = false,
  config = function()
    -- needs to be done after the module is loaded for the plugins
    -- auto commands to be loaded
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        local harp = require("harpoon")
        local map = function(keys, func, desc)
          vim.keymap.set({ 'n', 'v' }, keys, func, { desc = 'Harp: ' .. desc })
        end
        map("<leader>a", function() harp:list():add() end, "Add File")
        map("<C-h>", function() harp.ui:toggle_quick_menu(harp:list()) end, "Menu")
        map("<C-j>", function() harp:list():select(1) end, "Move file 1")
        map("<C-k>", function() harp:list():select(2) end, "Move file 2")
        map("<C-l>", function() harp:list():select(3) end, "Move file 3")
        map("<C-ù>", function() harp:list():select(4) end, "Move file 4")
      end,})
  end
}
