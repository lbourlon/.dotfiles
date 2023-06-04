-- Splits
vim.keymap.set("n", "<leader>e", "", {desc = "Split"})
vim.keymap.set("n", "<leader>el", ":vs<CR>",{desc = "Split Left"})
vim.keymap.set("n", "<leader>ej", ":sp<CR>",{desc = "Split Bellow"})

vim.keymap.set("n", "<leader>r", "", {desc = "Term Split"})
vim.keymap.set("n", "<leader>rl", ":vs|term<CR>",{desc = "Terminal on Left"})
vim.keymap.set("n", "<leader>rj", ":sp|term<CR>",{desc = "Terminal on Bellow"})

-- Splits Move
local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";
local change_window="<C-\\><C-N>".."<C-w>"
local modes = {'n','t','i','v'}

vim.keymap.set(modes, mv_up, change_window.."k")
vim.keymap.set(modes, mv_do, change_window.."j")
vim.keymap.set(modes, mv_le, change_window.."h")
vim.keymap.set(modes, mv_ri, change_window.."l")

-- Pane Quit, swa, & change hor to vert
vim.keymap.set("n", "<leader>pq", change_window.."q", {desc = "[P]ane [Q]uit"})
vim.keymap.set("n", "<leader>ps", change_window.."x", {desc = "[P]ane [S]wap"})
vim.keymap.set("n", "<leader>ph", "<C-w>t<C-w>H",{desc = "[P]ane [V]orizontal"})
vim.keymap.set("n", "<leader>pv", "<C-w>t<C-w>K",{desc = "[P]ane [H]orizontal"})

-- Pane Reajust Size
vim.keymap.set("n", "<C-h>", "<C-W>5<")
vim.keymap.set("n", "<C-l>", "<C-W>5>")
vim.keymap.set("n", "<C-k>", "<C-W>3-")
vim.keymap.set("n", "<C-j>", "<C-W>3+")

-- Terminal Management
local term_events = {"BufWinEnter", "WinEnter"}
local term_grouperino = vim.api.nvim_create_augroup("Term_grouperino", {clear = true})
vim.api.nvim_create_autocmd(term_events, {pattern="term://*" , command = "startinsert", group = term_grouperino})
vim.api.nvim_create_autocmd("TermOpen *",{command = "set bufhidden=delete", group = term_grouperino})
vim.api.nvim_create_autocmd("TermOpen *",{command = "startinsert", group = term_grouperino})
