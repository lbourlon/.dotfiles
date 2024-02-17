return {
  'nvim-lualine/lualine.nvim',  -- See `:help lualine.txt`
  config = function()
    require('lualine').setup{
      options = {
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        refresh = { statusline = 100 },
        globalstatus = true,
        padding = 1,
      },
      sections = {
        lualine_a = {{'mode', separator = {left='', right=''}}}, -- nice
        lualine_b = {{'branch', color = {fg="red"}}},
        lualine_c = {{'filename', path = 1 }},

        lualine_x = {{'searchcount', 'selectioncount', 'filetype'}},
        lualine_y = {{'diagnostics', always_visible = true, right_padding = 1,
          sections = {'error','warn'}}},

        lualine_z = {{'location', separator = {left='', right=''}, padding=0,
          fmt = function(s) return s:sub(s:find("%d"), s:find(':') - 1) end,}}
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = {'filename'},
        lualine_x = {}, lualine_y = {}, lualine_z = {}
      },

    }
  end,
}
