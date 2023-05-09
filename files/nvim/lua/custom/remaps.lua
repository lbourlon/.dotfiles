-- KEYMAPS
-- Move blocks on Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when moving pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Reajust size
vim.keymap.set("n", "<C-h>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-l>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-k>", ":resize +5<CR>")
vim.keymap.set("n", "<C-j>", ":resize -5<CR>")

-- change 2 pslit windows from vert to horiz and vice versa
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H",{desc = "Swap vert to horiz"})
vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K",{desc = "Swap horiz to vert"})

-- Terminal
vim.keymap.set("n", "<leader>rl", ":vs|term<CR>",{desc = "terminal on the left"})
vim.keymap.set("n", "<leader>rj", ":sp|term<CR>",{desc = "Terminal on bellow"})


local esc_string ="<C-\\><C-N>"

vim.keymap.set("t", "<esc>", esc_string,{desc = "Leave Terminal Mode"})
vim.keymap.set('t', 'jk', esc_string)

-- Window Move
local  mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";

vim.keymap.set("n", mv_up, "<C-w>k")
vim.keymap.set("n", mv_do, "<C-w>j")
vim.keymap.set("n", mv_le, "<C-w>h")
vim.keymap.set("n", mv_ri, "<C-w>l")

vim.keymap.set("t", mv_up, esc_string .. "<C-w>k")
vim.keymap.set("t", mv_do, esc_string .. "<C-w>j")
vim.keymap.set("t", mv_le, esc_string .. "<C-w>h")
vim.keymap.set("t", mv_ri, esc_string .. "<C-w>l")

-- Miscellaenous
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "[P]aste while keeping yanked"})
vim.keymap.set("n", "<leader>q", ":bp|sp|bn|bd<CR>", { desc = "Closes the current buffer" })
vim.keymap.set("t", "kk", esc_string..":bd!<CR>", { desc = "Closes the current buffer" })

--vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])
