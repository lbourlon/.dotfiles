-- KEYMAPS
-- Move blocks on Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when moving pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Terminal
local esc_string ="<C-\\><C-N>"
vim.keymap.set("t", "<esc>", esc_string,{desc = "Leave Terminal Mode"})
vim.keymap.set('t', 'jk', esc_string)
vim.keymap.set("t", "kk", esc_string..":bd!<CR>", { desc = "Closes the current buffer" })


-- Miscellaenous
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "[P]aste while keeping yanked"})
vim.keymap.set("n", "<leader>q", ":bp|sp|bn|bd<CR>", { desc = "Closes the current buffer" })


-- Inspired / Yoinked from Teej_dv
vim.keymap.set("n", "<a-r>", ":%s/<c-r><c-w>//g<left><left>") -- Replace current word
--vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
