local map = function(mode, keys, func, opts)
  local l_opts = {}
  if opts and opts['desc'] ~= nil then
    l_opts['desc'] = 'PERS: ' .. opts['desc']
  elseif opts and type(opts) == "string" then
    l_opts['desc'] = 'PERS: ' .. opts
  elseif opts then
    l_opts = opts
  else
    l_opts['desc'] = 'PERS: ' .. 'no desc'
  end
  vim.keymap.set(mode, keys, func, l_opts)
end

-- KEYMAPS
map("i", "<A-,>", "<esc>")

-- Move blocks on Visual mode
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move block Up"})
map("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move block Down"})

-- Keep cursor centered when moving pages
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")
map('n', "n", "nzzzv")
map('n', "N", "Nzzzv")
map('n', "J", "mzJ'z")

-- Terminal
local esc_string = "<C-\\><C-N>"
map("t", "<esc>", esc_string, { desc = "Leave Terminal Mode" })
map("t", "kk", esc_string .. ":bd!<CR>", { desc = "Closes the current buffer" })

-- Yanks
map("x", "<leader>p", "\"_dP", { desc = "[P]aste while keeping yanked" })
map("x", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Search Replace
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "nohl on <esc>");
map('n', "<leader>ru",  ":%s/\\<<c-r><c-w>\\>//g<left><left>",         "[R]eplace [U]nder")
map('n', "<leader>rb",  ":%s/^.*\\(<c-r><c-w>\\)\\@=//g<left><left>",  "[R]eplace [B]ehind")

map('n', "<leader>ra",  ":%s/\\(<c-r><c-w>\\)\\@<=.*$//g<left><left>", "[R]eplace [A]head")
map('n', "<leader>rts", ":%s/\\s\\+$//<CR>",                           "[R]eplace [T]railing [S]paces")
map('v', "<leader>rs",  '"wy:%s/<c-r>w//gc<left><left><left>',         "[R]eplace [S]election")

map('n', "<A-r>", ":%s//g<left><left>", "[R]eplace")
map("v", "<A-r>", ":s//g<left><left>",  "[R]eplace")

-- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev) -- became default in nvim v10.0
-- map('n', ']d', vim.diagnostic.goto_next) -- became default in nvim v10.0
map('n', '<leader>,', vim.diagnostic.open_float)
map('n', '<leader>;', vim.diagnostic.setloclist)

-- quickfix
map("n", 'ç', ":cprev<CR>", {desc = 'quickfix move'})
map("n", 'à', ":cnext<CR>", {desc = 'quickfix move'})


map("n", '<leader>zi', "mw:tabedit % <CR>'wzz", {desc = 'tab out pane'})
map("n", '<leader>zo', ":tabclose<CR>", {desc = 'tab close'})
map("n", "<S-l>", ":tabnext<CR>", {desc="Cycle to Next Tab"})
map("n", "<S-h>", ":tabprev<CR>", {desc="Cycle to Prev Tab"})

-- Miscellaneous
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no spaces
map({ 'n', 'v' }, 'Q', '<Nop>', { silent = true }) -- no Q
vim.keymap.set({'n', 'v'}, 'q:', function() print("go learn to quit") end)
map('n', '<leader>mpy', ":let @+ = expand('%:p') .. ':' .. line('.')<CR>", {desc = "[M]isc [Y]ank [P]ath"})
map('n', "ù", "<C-^>") -- cuz of french keyboard :)


-- make session restore with :
-- local function select_example()
--   vim.ui.select({'option_1',"option_2"}, {prompt="Select surround"}, function(choice) print(choice .. 'is a good one') end)
-- end

-- test later
-- nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``'
-- noremap * :let @/ = "\\<<C-r><C-w>\\>"<cr>:set hlsearch<cr>
