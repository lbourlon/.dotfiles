local theme = "onedark";

if (theme == "onedark") then
  return {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        -- toggle_style_key = "<leader>csw", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
        style = 'darker',
        transparent = true,
        term_colors = true,

        colors = {
          -- grey = "#ffffff", -- linenumbs
          -- light_grey =  "#ffffff", -- punctuation
          white = "#ffffff",
        },
        highlights = {
          -- Comment = {fg = "$white"},
          -- TSVariableBuiltin = {fg = "$white"},
          -- TSVariable = {fg = "$white"},


          IndentBlanklineIndent1 = { fg = '$light_grey' },
          IndentBlanklineIndent2 = { fg = '$light_grey' },
          IndentBlanklineIndent3 = { fg = '$light_grey' },
          IndentBlanklineIndent4 = { fg = '$light_grey' },
          IndentBlanklineIndent5 = { fg = '$light_grey' },
          IndentBlanklineIndent6 = { fg = '$light_grey' },
          IndentBlanklineContextChar = { fg = '$white' },
        },
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
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
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
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
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
