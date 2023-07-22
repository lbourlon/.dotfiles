return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim', },

  config = function ()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, {desc = 'Harp: ' .. desc })
    end

    nmap("<leader>a", mark.add_file, "Add File")

    nmap("<C-h>", ui.toggle_quick_menu, "Menu")
    nmap("<C-j>", function() ui.nav_file(1) end, "Move file 1")
    nmap("<C-k>", function() ui.nav_file(2) end, "Move file 2")
    nmap("<C-l>", function() ui.nav_file(3) end, "Move file 3")
    nmap("<C-m>", function() ui.nav_file(4) end, "Move file 4")
  end
}

