-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#333333 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#222222 gui=nocombine]]


return {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    -- See `:help ibl`
    config = function ()
	require('ibl').setup{
            enabled=true,
            indent= { char = '│' },
            whitespace = { highlight = { "Whitespace", "NonText" } },
       -- scope = { exclude = { language = { "lua" } } },

            -- char = '┊',
            -- show_trailing_blankline_indent = false,
            -- show_current_context = true,
            -- char_highlight_list = {
            --     "IndentBlanklineIndent1",
            --     "IndentBlanklineIndent2",
            --     "IndentBlanklineIndent3",
            --     "IndentBlanklineIndent4",
            --     "IndentBlanklineIndent5",
            --     "IndentBlanklineIndent6",
            -- },
        }
    end

  }
