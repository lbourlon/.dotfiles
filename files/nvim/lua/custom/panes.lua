-- Splits
vim.keymap.set("n", "<leader>el", ":vs<CR>",{desc = "Split on Left"})
vim.keymap.set("n", "<leader>ej", ":sp<CR>",{desc = "Split on Bellow"})
vim.keymap.set("n", "<leader>rl", ":vs|term<CR>",{desc = "Terminal on Left"})
vim.keymap.set("n", "<leader>rj", ":sp|term<CR>",{desc = "Terminal on Bellow"})

-- Pane Move
local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";
local esc ="<C-\\><C-N>"
local change_window  = "<C-w>"

vim.keymap.set("t", mv_up, esc..change_window.."k")
vim.keymap.set("t", mv_do, esc..change_window.."j")
vim.keymap.set("t", mv_le, esc..change_window.."h")
vim.keymap.set("t", mv_ri, esc..change_window.."l")

vim.keymap.set("n", mv_up, change_window.."k")
vim.keymap.set("n", mv_do, change_window.."j")
vim.keymap.set("n", mv_le, change_window.."h")
vim.keymap.set("n", mv_ri, change_window.."l")

-- Pane Quit, swa, & change hor to vert
vim.keymap.set("n", "<leader>pq", change_window.."q", {desc = "[P]ane [Q]uit"})
vim.keymap.set("n", "<leader>ps", change_window.."x", {desc = "[P]ane [S]wap"})
vim.keymap.set("n", "<leader>ph", "<C-w>t<C-w>H",{desc = "[P]ane [V]orizontal"})
vim.keymap.set("n", "<leader>pv", "<C-w>t<C-w>K",{desc = "[P]ane [H]orizontal"})

-- Pane Reajust Size
vim.keymap.set("n", "<C-h>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-l>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-k>", ":resize +4<CR>")
vim.keymap.set("n", "<C-j>", ":resize -5<CR>")

-- Terminal Management
-- https://neovim.io/doc/user/autocmd.html

local term_events = {"BufWinEnter", "WinEnter"}
vim.api.nvim_create_autocmd(term_events, {pattern="term://*" , command = "startinsert"})
--vim.api.nvim_create_autocmd("BufLeave term://*",{command = "stopinsert"})
vim.api.nvim_create_autocmd("TermOpen *",{command = "set bufhidden=delete"})
vim.api.nvim_create_autocmd("TermOpen *",{command = "startinsert"})

-- "autocmd BufLeave term://* stopinsert"
-- "autocmd BufWinEnter,WinEnter term://* startinsert"
-- "autocmd TermOpen * startinsert"

