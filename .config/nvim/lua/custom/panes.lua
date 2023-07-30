local nmap = function(keys, func, desc)
  if desc then
    desc = 'Panes: ' .. desc
  else
    desc = 'Panes: ' .. 'no desc'
  end
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Splits
-- vim.keynmap.set("n", "<leader>e", "", "Split"})
nmap("<leader>l", ":vs<CR>", "Split Left")
nmap("<leader>j", ":sp<CR>", "Split Bellow")

-- Splits Move
-- local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";
local change_window = "<C-\\><C-N>" .. "<C-w>"

-- Pane Quit, swa, & change hor to vert
nmap("<C-x>",       change_window .. "q", "Quit Pane")
nmap("<leader>pq",  change_window .. "q", "[P]ane [Q]uit")
nmap("<leader>ps",  change_window .. "x", "[P]ane [S]wap")
nmap("<leader>pv",  "<C-w>t<C-w>H", "[P]ane [V]orizontal")
nmap("<leader>ph",  "<C-w>t<C-w>K","[P]ane [H]orizontal")

-- Pane Reajust Size
nmap("<leader>pl",  change_window .."5<", "why?") -- <C-W>5<
nmap("<leader>ph",  change_window .."5>", "why?") -- <C-W>5>
nmap("<leader>pj",  change_window .."3-", "why?")-- <C-W>3-
nmap("<leader>pk",  change_window .."3+", "why?") -- <C-W>3-

nmap("<C-Up>",    change_window .."3-", "why?")-- <C-W>3-
nmap("<C-Down>",  change_window .."3+", "why?") -- <C-W>3-
nmap("<C-Left>", change_window .."5<", "why?") -- <C-W>5<
nmap("<C-Right>",  change_window .."5>", "why?") -- <C-W>5>

-- nmap("n", "<C-Right>",  ":resize -5<CR>") -- <C-W>5<
-- nmap("n", "<C-Left>",   ":resize -5<CR>") -- <C-W>5>
-- nmap("n", "<C-Up>",     ":vertical resize +3<CR>")-- <C-W>3-
-- nmap("n", "<C-Down>",   ":vertical resize +3<CR>") -- <C-W>3-
-- vim.api.nvim_set_keymap('n', '<C-Right>', change_window .."5<", {desc = "j"})
-- vim.api.nvim_set_keymap('n', '<C-Left>', change_window .."5>",{desc = "j"} )
-- vim.api.nvim_set_keymap('n', '<C-Up>', change_window .."3-"  ,  {desc = "j"})
-- vim.api.nvim_set_keymap('n', '<C-Down>', change_window .."3+", {desc = "j"})

-- Terminal Management
local term_events = { "BufWinEnter", "WinEnter" }
local term_grouperino = vim.api.nvim_create_augroup("Term_grouperino", { clear = true })
vim.api.nvim_create_autocmd(term_events, { pattern = "term://*", command = "startinsert", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen *", { command = "set bufhidden=delete", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen *", { command = "startinsert", group = term_grouperino })
