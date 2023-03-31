-- KEYMAPS
-- Move blocks on Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when moving pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- leader P pastes while keeping the copied
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Replaced by Neotree
-- vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)


-- OPTIONS

vim.opt.nu = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.o.hlsearch = true

-- vim.opt.wrap = false 

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
