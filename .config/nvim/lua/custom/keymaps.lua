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

-- Miscellaneous
map("x", "<leader>p", "\"_dP", { desc = "[P]aste while keeping yanked" })
map("x", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no spaces
map('n', 'Q', '<Nop>', { silent = true })                -- no Q

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- cuz of french keyboard :)
map('n', "ù", "<C-^>")

-- Search Replace
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "nohl on <esc>");
map('n', "<leader>ru",  ":%s/\\<<c-r><c-w>\\>//g<left><left>",         "[R]eplace [U]nder")
map('n', "<leader>rb",  ":%s/^.*\\(<c-r><c-w>\\)\\@=//g<left><left>",  "[R]eplace [B]ehind")

map('n', "<leader>ra",  ":%s/\\(<c-r><c-w>\\)\\@<=.*$//g<left><left>", "[R]eplace [A]head")
map('n', "<leader>rts", ":%s/\\s\\+$//<CR>",                           "[R]eplace [T]railing [S]paces")
map('v', "<leader>rs",  '"wy:%s/<c-r>w//gc<left><left><left>',         "[R]eplace [S]election")

map('n', "<A-r>", ":%s//g<left><left>", "[R]eplace")
map("v", "<A-r>", ":s//g<left><left>",  "[R]eplace")

-- My Surround
local surround={['"']='"',["'"]="'",['(']=')',['[']=']',['{']='}',['<']='>', ['`']='`'}
for k, v in pairs(surround) do
  map('v', '<leader>s' .. k, 'c' .. k .. v .. '<Esc><left>p<right>',
    {desc = "Surrounds selection with " .. k})
end
map({'n', 'v'}, '<leader>s',"", {desc="Unbinds leader s"})

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>,', vim.diagnostic.open_float)
map('n', '<leader>;', vim.diagnostic.setloclist)

-- quickfix
map("n", 'ç', ":cprev<CR>", {desc = 'quickfix move'})
map("n", 'à', ":cnext<CR>", {desc = 'quickfix move'})


map("n", '<leader>zi', "mw:tabedit % <CR>'wzz", {desc = 'tab out pane'})
map("n", '<leader>zo', ":tabclose<CR>", {desc = 'tab close'})
map("n", "<S-l>", ":tabnext<CR>", {desc="Cycle to Next Tab"})
map("n", "<S-h>", ":tabprev<CR>", {desc="Cycle to Prev Tab"})


-- test later
-- nnoremap <expr> * ':%s/'.expand('<cword>').'//gn<CR>``'
-- noremap * :let @/ = "\\<<C-r><C-w>\\>"<cr>:set hlsearch<cr>
