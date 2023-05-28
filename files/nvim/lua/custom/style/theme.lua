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
			local mocha = require("catppuccin.palettes").get_palette "mocha"

			require('catppuccin').setup {
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				term_colors = true,
			}

			vim.cmd.colorscheme 'catppuccin'
		end,
	}
end
