return {
  'nvim-lualine/lualine.nvim',  -- See `:help lualine.txt`
  config = function()
    require('lualine').setup{
      options = {
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {"neo-tree", "neo-tree-popup", "None", ""},
        refresh = { statusline = 100 },
        globalstatus = true,

      },
      sections = {
        lualine_a = {{'mode', separator = {left='', right=''}}}, -- nice
        lualine_b = {{'branch', color = {fg="red"}}},
        lualine_c = {{'filename', path = 1 }},

        lualine_x = {'searchcount', 'selectioncount',  'filetype'},
        lualine_y = {{'diagnostics', always_visible = true, sections = { 'error', 'warn'}, }},
        lualine_z = {{'location', separator = {left='', right=''},
          fmt = function(str)
            local i = str:find(':') - 1
            return str:sub(0,i) end
        }}, -- nice
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = {'filename'},
        lualine_x = {}, lualine_y = {}, lualine_z = {}
      },
    }
  end,
}

