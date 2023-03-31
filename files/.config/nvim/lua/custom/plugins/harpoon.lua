return {
  --'nvim-lua/plenary.nvim'
  'theprimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui   = require("harpoon.ui")

    vim.keymap.set("n", "<leader>mm", ui.toggle_quick_menu, {desc="[m]ark [m]enu"})

    vim.keymap.set("n", "<leader>ma", mark.add_file, {desc="[m]ark [a]dd"})
    vim.keymap.set("n", "<leader>mq", function() ui.nav_file(1) end, {desc="[m]ark 1"})
    vim.keymap.set("n", "<leader>ms", function() ui.nav_file(2) end, {desc="[m]ark 2"})
    vim.keymap.set("n", "<leader>md", function() ui.nav_file(3) end, {desc="[m]ark 3"})
    vim.keymap.set("n", "<leader>mf", function() ui.nav_file(4) end, {desc="[m]ark 4"})

    require("harpoon").setup {}

  end,
}


