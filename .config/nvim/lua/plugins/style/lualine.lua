return {
  'nvim-lualine/lualine.nvim',  -- See `:help lualine.txt`
  config = function()

    local location = function(str)
      local line = vim.fn.line('.')
      local col = vim.fn.virtcol('.')
      return string.format('%03d:%03d', line, col)
    end

    require('lualine').setup{
      options = {
        theme = 'onedark',
        component_separators = '',
        section_separators = '',
        refresh = { statusline = 150 },
        globalstatus = true,
      },

      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { 'filetype', icon_only = true, padding = {left = 1}},
          { 'filename', path = 1, symbols = { readonly = '[RO]',}, padding = 0},
        },

        lualine_x = {{ 'tabs', show_modified_status = false, padding = 0}},

        lualine_y = {
          {'branch', color = {fg="red"}},
          {'diagnostics', always_visible = true, sections = {'error','warn'}},
        },
        lualine_z = {{'encoding', padding = 1, fmt = location}},
      },
      extensions = {'quickfix'},
    }
  end,
}
