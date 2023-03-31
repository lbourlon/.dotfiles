-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    -- local nt = require('neo-tree')
    local nt_cmd = require('neo-tree.command')

    vim.keymap.set("n", "<leader>fs",function() nt_cmd.execute({action = "show", toggle="true"}) end, {desc = "[f]ile-tree [s]how (toggle)"})
    vim.keymap.set("n", "<leader>fd",
      function()
        -- if not neo-tree, then open it and focus on currently opened file 
        if vim.bo.filetype ~= "neo-tree-popup" or "neo-tree"then
          nt_cmd.execute({action = "focus", reveal="true"})
          -- else the remap below happens and opens current file 
        end
      end,
      {desc = "[f]iles focus"})

    require('neo-tree').setup({
      -- Pero
      close_if_last_window = true,
      window = {
        width=20,
        auto_expand_width=true,
        mappings={
          ["<leader>fd"] = "open",
        },
      },
      filesystem = {
        filtered_items = { hide_dotfiles = false,},
        follow_current_file = true,
      }
    })
  end,
}
