-- Splits
vim.keymap.set("n", "<leader>el", ":vs<CR>",{desc = "Split on Left"})
vim.keymap.set("n", "<leader>ej", ":sp<CR>",{desc = "Split on Bellow"})
vim.keymap.set("n", "<leader>rl", ":vs|term<CR>",{desc = "Terminal on Left"})
vim.keymap.set("n", "<leader>rj", ":sp|term<CR>",{desc = "Terminal on Bellow"})



-- Pane Move
local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";

local cw  = "<C-w>"
vim.keymap.set("n", mv_up, cw.."k")
vim.keymap.set("n", mv_do, cw.."j")
vim.keymap.set("n", mv_le, cw.."h")
vim.keymap.set("n", mv_ri, cw.."l")

local esc ="<C-\\><C-N>"
vim.keymap.set("t", mv_up, esc..cw.."k")
vim.keymap.set("t", mv_do, esc..cw.."j"
)
vim.keymap.set("t", mv_le, esc..cw.."h")
vim.keymap.set("t", mv_ri, esc..cw.."l")

-- Pane Quit
vim.keymap.set("n", "<leader>pq", cw.."q", {desc = "[P]ane [Q]uit"})
vim.keymap.set("n", "<leader>ps", cw.."x", {desc = "[P]ane [S]wap"})
-- change 2 pslit windows from vert to horiz and vice versa
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H",{desc = "Swap vert to horiz"})
vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K",{desc = "Swap horiz to vert"})


local unload = "bunload!"
local quit = "bdelete!"
local teste = ":setlocal bufhidden=delete"
local test = ":autocmd TermEnter * startinsert"

local auto_close_term = "autocmd TermOpen * set bufhidden=delete"
vim.cmd(auto_close_term)

local term_enter  = "autocmd BufWinEnter,WinEnter term://* startinsert"
local term_leave = "autocmd BufLeave term://* stopinsert"
local term_open = "autocmd TermOpen * startinsert"

vim.cmd(term_enter)
vim.cmd(term_leave)
vim.cmd(term_open)


-- Reajust size
vim.keymap.set("n", "<C-h>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<C-l>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-k>", ":resize +4<CR>")
vim.keymap.set("n", "<C-j>", ":resize -5<CR>")
