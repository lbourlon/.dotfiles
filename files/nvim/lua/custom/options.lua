-- VIM OPTIONS
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.nu = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
--vim.opt.expandtab = false

vim.opt.smartindent = true
--vim.opt.cindent = true
vim.o.hlsearch = true

-- vim.opt.wrap = false 

vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.ttyfast = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50


-- Autosave things :)
vim.api.nvim_create_autocmd({"FocusLost"},{command = "silent! wa"})

local event_list = {"BufLeave", "BufWinLeave","WinLeave"}
vim.api.nvim_create_autocmd(event_list,{command = "silent! w!"})
