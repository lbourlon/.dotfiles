-- I was having issues trying to configure these in the harpoon file.
-- My guess is that there's some race condition caused by lazy nvim 
-- This way things work

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

local map = function(keys, func, desc)
  vim.keymap.set({ 'n', 'v' }, keys, func, { desc = 'Harp: ' .. desc })
end

map("<leader>a", mark.add_file, "Add File")
map("<C-h>", ui.toggle_quick_menu, "Menu")
map("<C-j>", function() ui.nav_file(1) end, "Move file 1")
map("<C-k>", function() ui.nav_file(2) end, "Move file 2")
map("<C-l>", function() ui.nav_file(3) end, "Move file 3")
map("<C-m>", function() ui.nav_file(4) end, "Move file 4")
