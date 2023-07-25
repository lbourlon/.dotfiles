-- UnlEss you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


return {
  "nvim-neo-tree/neo-tree.nvim",

  -- cmd="DirectoryLoad", -- LazyLoad
  keys = {{"<leader>f"}},
  version = "*",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    -- local nt = require('neo-tree')
    local nt_cmd = require('neo-tree.command')

    require('neo-tree').setup({
      close_if_last_window = true,
      window = {
        width=20,
        auto_expand_width=false,
        mappings={
          ["l"] = "open",
        },
      },
      filesystem = {
        filtered_items = { hide_dotfiles = false,},
        follow_current_file = {enabled = true,},
      }
    })

    vim.keymap.set("n", "<leader>f",
      function() nt_cmd.execute({action = "focus", toggle="true"}) end,
      {desc = "[F]ile-tree Toggle"})

  end,
}
