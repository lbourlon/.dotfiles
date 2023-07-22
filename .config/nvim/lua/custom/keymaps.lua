local map = function(mode, keys, func, opts)
  if opts and opts['desc'] ~= nil then
    opts['desc'] = 'PERS: ' .. opts['desc']
  elseif opts then
    opts['desc'] = 'PERS: ' .. 'no desc'
  else
    opts = {};
    opts['desc'] = 'PERS: ' .. 'no desc'
  end
  vim.keymap.set(mode, keys, func, opts)
end

-- KEYMAPS
map("i", "<A-,>", "<esc>")

-- Move blocks on Visual mode
map("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move block Down"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move block Up"})
map("v", "<A-r>", ":s//g<left><left>") -- Search replace in highlight

-- Keep cursor centered when moving pages
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")
map('n', "n", "nzzzv")
map('n', "N", "Nzzzv")
map('n', "J", "mzJ`z")

-- Terminal
local esc_string = "<C-\\><C-N>"
map("t", "<esc>", esc_string, { desc = "Leave Terminal Mode" })
map("t", "kk", esc_string .. ":bd!<CR>", { desc = "Closes the current buffer" })

-- Miscellaenous
map("x", "<leader>p", "\"_dP", { desc = "[P]aste while keeping yanked" })
map("x", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
map('n', "<leader>q", ":bp|sp|bn|bd<CR>", { desc = "Closes the current buffer" })
-- map("n", "<leader>", ":s//g<left><left>")

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no spaces
map('n', 'Q', '<Nop>', { silent = true })                -- no Q

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- cuz of french keyboard :)
vim.keymap.set('n', "ù", "<C-^>")

-- Inspired / Yoinked from Teej_dv
map('n', "<A-r>", ":%s/<c-r><c-w>//g<left><left>") -- Replace current word
map('n', "<leader>sws", ":%s/\\s\\+$//<CR>")       -- Remove whitespaces
--map('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- Yoinked from theprimeagen
map('n', "C-f", ":silent !tmux neww tmux-sessionizer<CR>")

-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev)
-- map('n', ']d', vim.diagnostic.goto_next)
-- map('n', '<leader>,', vim.diagnostic.open_float)
-- map('n', '<leader>;', vim.diagnostic.setloclist)
