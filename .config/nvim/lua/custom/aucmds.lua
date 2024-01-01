local headers_in_c = vim.api.nvim_create_augroup("headers_in_c", {clear = true})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.h"},
  callback = function () vim.cmd.setfiletype("c") end,
  group=headers_in_c,
})
