local theme = "onedark";

if(theme == "onedark") then

	return{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()

			require('onedark').setup {
				style = 'darker',
				transparent = true,
				term_colors = true,
			}

			vim.cmd.colorscheme 'onedark'
		end,
	}
elseif (theme == "catp") then

	return{
		'catppuccin/nvim',
		priority = 1000,
		config = function()
			require('catppuccin').setup {
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				term_colors = true,
			}

			vim.cmd.colorscheme 'catppuccin'
		end,
	}
elseif (theme == "day") then
	return {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "day", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			transparent = false, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		},
	}
	-- vim.cmd.colorscheme 'tokyonight'
end
