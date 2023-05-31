return {
	'nvim-lualine/lualine.nvim',  -- See `:help lualine.txt`
	config = function()
		local funny_haha = '󰣇'
		require('lualine').setup{
			options = {
				icons_enabled = true,
				theme = 'onedark',
				--theme = 'iceberg_dark',
				--theme = 'ayu_dark',
				-- theme = "gruvbox_dark",
				-- component_separators = '|',
				-- section_separators = '',
				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {"neo-tree", "neo-tree-popup", "None", ""}, -- maybe see how to remove it from terminal ?
				-- color={bg="none"},
		},
			sections = {
				lualine_a = {{'mode', separator = {left='', right=''}}}, -- nice
				lualine_b = {'branch'},
				lualine_c = {'filename'}, --, color={bg="none"}}},
				lualine_x = {'searchcount', 'selectioncount', 'fileformat', 'filetype'},
				lualine_y = {'filesize'},
				lualine_z = {{'progress', separator = {left='', right=''}}}, -- nice
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
		}
	end,
}
