-- [[ Cleanse yourself from cpp ]]
local headers_in_c = vim.api.nvim_create_augroup("headers_in_c", {clear = true})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.h"},
  callback = function () vim.cmd.setfiletype("c") end,
  group=headers_in_c,
})


local le_group = vim.api.nvim_create_augroup('le_group', { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.robot"},
  callback = function ()
    vim.api.nvim_set_option("colorcolumn", "100")
  end,
  group=le_group,
})

-- [[ incsearch better highlight ]]
-- vim.api.nvim_create_autocmd({'CmdLineEnter'}, { pattern = '*', callback = function() vim.opt.hlsearch = true end, group=le_group, })
-- vim.api.nvim_create_autocmd({'CmdLineLeave'}, { pattern = '*', callback = function() vim.opt.hlsearch = false end, group=le_group, })

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group=le_group,
})

