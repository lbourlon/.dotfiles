local map = function(mode, keys, func, opts)
  if opts and opts['desc'] ~= nil then
    opts['desc'] = 'Panes: ' .. opts['desc']
  elseif opts then
    opts['desc'] = 'Panes: ' .. 'no desc'
  else
    opts = {};
    opts['desc'] = 'Panes: ' .. 'no desc'
  end
  vim.keymap.set(mode, keys, func, opts)
end

-- Splits
-- vim.keymap.set("n", "<leader>e", "", {desc = "Split"})
-- vim.keymap.set("n", "<leader>el", ":vs<CR>",{desc = "Split Left"})
-- vim.keymap.set("n", "<leader>ej", ":sp<CR>",{desc = "Split Bellow"})

map("n", "<leader>r", "", {desc = "Term Split"})
map("n", "<leader>rl", ":vs|term<CR>",{desc = "Terminal on Left"})
map("n", "<leader>rj", ":sp|term<CR>",{desc = "Terminal on Bellow"})

-- Splits Move
local mv_up, mv_do, mv_le, mv_ri = "<A-k>", "<A-j>", "<A-h>", "<A-l>";
local change_window="<C-\\><C-N>".."<C-w>"
local modes = {'n','t','i','v'}

-- map(modes, mv_up, change_window.."k")
-- map(modes, mv_do, change_window.."j")
-- map(modes, mv_le, change_window.."h")
-- map(modes, mv_ri, change_window.."l")

-- Pane Quit, swa, & change hor to vert
map("n", "<leader>pq", change_window.."q", {desc = "[P]ane [Q]uit"})
map("n", "<leader>ps", change_window.."x", {desc = "[P]ane [S]wap"})
map("n", "<leader>pv", "<C-w>t<C-w>H",{desc = "[P]ane [V]orizontal"})
map("n", "<leader>ph", "<C-w>t<C-w>K",{desc = "[P]ane [H]orizontal"})


-- Pane Reajust Size
-- map({"n", "t"}, "<C-h>", change_window.."5<") -- <C-W>5< 
-- map({"n", "t"}, "<C-l>", change_window.."5>") -- <C-W>5>
-- map({"n"}, "<C-k>", change_window.."3-")-- <C-W>3-
-- map({"n"}, "<C-j>", change_window.."3+") -- <C-W>3- 

-- Terminal Management
local term_events = {"BufWinEnter", "WinEnter"}
local term_grouperino = vim.api.nvim_create_augroup("Term_grouperino", {clear = true})
vim.api.nvim_create_autocmd(term_events, {pattern="term://*" , command = "startinsert", group = term_grouperino})
vim.api.nvim_create_autocmd("TermOpen *",{command = "set bufhidden=delete", group = term_grouperino})
vim.api.nvim_create_autocmd("TermOpen *",{command = "startinsert", group = term_grouperino})
