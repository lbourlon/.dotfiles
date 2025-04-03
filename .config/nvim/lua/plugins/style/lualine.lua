return {
  'nvim-lualine/lualine.nvim',  -- See `:help lualine.txt`
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()

    local location = function(_)
      local line = vim.fn.line('.')
      local col = vim.fn.virtcol('.')
      return string.format('%03d:%03d', line, col)
    end

    require('lualine').setup{
      options = {
        theme = 'onedark',
        component_separators = '',
        -- component_separators = { left = '', right = '' },
        -- section_separators = '',
        section_separators = { left = '', right = '' },
        refresh = { statusline = 150 },
        globalstatus = true,
      },

      sections = {
        lualine_a = {{'mode', separator = {left='', right=''}, padding = 0}}, -- nice
        lualine_b = {},
        lualine_c = {
          { 'filetype', icon_only = true, padding = {left = 1}},
          { 'filename', path = 1, symbols = { readonly = '[RO]',}, padding = 0},
        },

        -- lualine_x = {{ 'tabs', show_modified_status = false, padding = 0}},
        lualine_x = {{'branch', color = {fg="red"}, }},

        lualine_y = {
          {'diagnostics', always_visible = true, sections = {'error','warn'}},
        },
        lualine_z = {{'encoding', separator = {left='', right=''}, padding = 1, fmt = location}},
      },
      extensions = {'quickfix'},
    }
  end,
}
