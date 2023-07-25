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

nmap("<leader>r", "", "Term Split")
nmap("<leader>rl", ":vs|term<CR>", "Terminal on Left")
nmap("<leader>rj", ":sp|term<CR>", "Terminal on Bellow")

-- Splits Move
-- local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";
local change_window = "<C-\\><C-N>" .. "<C-w>"
-- local modes = {'n','t','i','v'}

-- nmap(modes, mv_up, change_window.."k")
-- nmap(modes, mv_do, change_window.."j")
-- nmap(modes, mv_le, change_window.."h")
-- nmap(modes, mv_ri, change_window.."l")

-- Pane Quit, swa, & change hor to vert
nmap("<leader>pq", change_window .. "q", "[P]ane [Q]uit")
nmap("<leader>ps", change_window .. "x", "[P]ane [S]wap")
nmap("<leader>pv", "<C-w>t<C-w>H", "[P]ane [V]orizontal")
nmap("<leader>ph", "<C-w>t<C-w>K","[P]ane [H]orizontal")


-- Pane Reajust Size
-- nmap({"n", "t"}, "<C-h>", change_window.."5<") -- <C-W>5<
-- nmap({"n", "t"}, "<C-l>", change_window.."5>") -- <C-W>5>
-- nmap({"n"}, "<C-k>", change_window.."3-")-- <C-W>3-
-- nmap({"n"}, "<C-j>", change_window.."3+") -- <C-W>3-

-- Terminal Management
local term_events = { "BufWinEnter", "WinEnter" }
local term_grouperino = vim.api.nvim_create_augroup("Term_grouperino", { clear = true })
vim.api.nvim_create_autocmd(term_events, { pattern = "term://*", command = "startinsert", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen *", { command = "set bufhidden=delete", group = term_grouperino })
vim.api.nvim_create_autocmd("TermOpen *", { command = "startinsert", group = term_grouperino })
