-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#333333 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#222222 gui=nocombine]]


return {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    opts = {
      -- char = '┊',
      char = '│',
      show_trailing_blankline_indent = false,
    show_current_context = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    },

  }
