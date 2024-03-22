local theme = "onedark";

if (theme == "onedark") then
  return {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        -- toggle_style_key = "<leader>csw", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep'},
        -- style = 'darker',
        style = 'darker',
        --transparent = true,
        --term_colors = true,
        --
        code_style = { comments = 'italic', keywords = 'none', functions = 'none', strings = 'none', variables = 'none' },

        colors = {
          my_lblue = '#2a8df4',
          my_blue = '#90a9ef',
          my_white = '#ffffff',
          my_black = '#000000',
        },
        highlights = {
          ["IncSearch"] = {fg =  '$my_white', bg = '$my_lblue'},
          ["Search"]    = {fg =  '$my_black', bg = '$my_blue'},
          ["CurSearch"] = {fg =  '$my_white', bg = '$my_lblue'},

          -- ["comments"] = {fg = '$dark_green', fmt = 'none'},
          -- ["@comment"] = {fg = '$dark_green', fmt = 'none'},
          -- ["@lsp.type.comment"] = {fg = '$dark_green', fmt = 'none'},
          -- ["LineNr"] = {fg = '$light_grey', fmt = 'none'},
          -- ["Whitespace"] = {fg = '$grey', fmt = 'none'},
        },

      --   diagnostics = {
      --     darker = true, -- darker colors for diagnostic
      --     undercurl = true,   -- use undercurl instead of underline for diagnostics
      --     background = true,    -- use background color for virtual text
      -- },

      }
      vim.cmd.colorscheme 'onedark'
    end,
  }
elseif (theme == "catp") then
  return {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        -- flavour = "macchiato", -- latte, frappe, macchiato, mocha
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        --transparent_background = true,
        --term_colors = true,
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  }
elseif (theme == "tokyo") then
  return {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        --style = "", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        -- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        -- dim_inactive = false, -- dims inactive windows
        -- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  }
end
