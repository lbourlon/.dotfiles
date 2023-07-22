-- KEYMAPS
vim.keymap.set("i", "<A-,>", "<esc>")

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
vim.keymap.set("x", "<leader>y", "\"+y", {desc = "[Y]ank to system clipboard"})
vim.keymap.set("n", "<leader>q", ":bp|sp|bn|bd<CR>", { desc = "Closes the current buffer" })


vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no spaces

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


vim.keymap.set("v", "<A-r>", ":s//g<left><left>") -- Search replace in highlight

-- Inspired / Yoinked from Teej_dv
vim.keymap.set("n", "<A-r>", ":%s/<c-r><c-w>//g<left><left>") -- Replace current word
vim.keymap.set("n", "<leader>sws", ":%s/\\s\\+$//<CR>") -- Remove whitespaces
--vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>,', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>;', vim.diagnostic.setloclist)
