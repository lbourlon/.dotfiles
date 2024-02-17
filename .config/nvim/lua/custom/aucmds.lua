-- [[ Cleanse yourself from cpp ]]
local headers_in_c = vim.api.nvim_create_augroup("headers_in_c", {clear = true})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.h"},
  callback = function () vim.cmd.setfiletype("c") end,
  group=headers_in_c,
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.robot"},
  callback = function ()
    vim.api.nvim_set_option("colorcolumn", "100")
  end,
})

-- vim.api.nvim_create_user_command('Align', "'<,'>%!column -t -s = -o =", {nargs = 1})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


