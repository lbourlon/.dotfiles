return {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help indent_blankline.txt`
    -- See `:help ibl`
    config = function()
        require('ibl').setup {
            enabled = true,
            indent = { char = '│' },
            whitespace = { highlight = { "Whitespace", "NonText" } },
        }
    end
}
