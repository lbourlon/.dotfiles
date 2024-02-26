local nmap = function(keys, func, desc)
  if desc then
    desc = 'Panes: ' .. desc
  else
    desc = 'Panes: ' .. 'no desc'
  end
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Splits
nmap("<leader>l", ":vs<CR>", "Split Left")
nmap("<leader>j", ":sp<CR>", "Split Bellow")

-- Splits Move
local change_window = "<C-\\><C-N>" .. "<C-w>"

-- Pane Quit, swa, & change hor to vert
nmap("<C-x>",       change_window .. "q", "Quit Pane")
nmap("<leader>pq",  change_window .. "q", "[P]ane [Q]uit")
nmap("<leader>ps",  change_window .. "x", "[P]ane [S]wap")
nmap("<leader>pv",  "<C-w>t<C-w>H", "[P]ane [V]orizontal")
nmap("<leader>ph",  "<C-w>t<C-w>K","[P]ane [H]orizontal")

-- Pane Reajust Size
nmap("<C-Up>",    change_window .."3-", "Resize window")-- <C-W>3-
nmap("<C-Down>",  change_window .."3+", "Resize window") -- <C-W>3-
nmap("<C-Left>", change_window .."5<",  "Resize window") -- <C-W>5<
nmap("<C-Right>",  change_window .."5>","Resize window") -- <C-W>5>


-- Terminal Management

nmap("<leader>r", "", "Term Split")
nmap("<leader>rl", ":vs|term<CR>", "Terminal on Left")
nmap("<leader>rj", ":sp|term<CR>", "Terminal on Bellow")

local term_events = { "BufWinEnter", "WinEnter" }
local term_grouperino = vim.api.nvim_create_augroup("Term_grouperino", { clear = true })
vim.api.nvim_create_autocmd(term_events, { pattern = "term://*", command = "startinsert", group = term_grouperino })
vim.api.nvim_create_autocmd(term_events, { pattern = "[No Name]", command = "set bufhidden=delete", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen", { command = "set bufhidden=delete", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen", { command = "set nonumber", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen", { command = "set norelativenumber", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen", { command = "set signcolumn=no", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", group = term_grouperino })
