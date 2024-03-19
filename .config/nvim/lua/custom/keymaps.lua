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
map("v", "<C-p>", ":m '<-2<CR>gv=gv", {desc = "Move block Up"})
map("v", "<C-n>", ":m '>+1<CR>gv=gv", {desc = "Move block Down"})

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
map('n', "<leader>rc",  ":%s/<c-r><c-w>//g<left><left>", {desc = "[R]eplace [c]urrent word"})
map('n', "<leader>rws", ":%s/\\s\\+$//<CR>", {desc = "[R]emove trailing [W]hitespaces"})
map('n', "<leader>rb", ":%s/^.*\\(<c-r><c-w>\\)\\@=//g<left><left>",  {desc = "[R]eplace [B]ehind"})
map('n', "<leader>ra", ":%s/\\(<c-r><c-w>\\)\\@<=.*$//g<left><left>", {desc = "[R]eplace [A]head"})

map('n', "<A-r>", ":%s//g<left><left>", {desc = "Start search and replace"})
map("v", "<A-r>", ":s//g<left><left>", {desc = "Start search and replace"})

-- TODO: Better surround
local surround={['"']='"',["'"]="'",['(']=')',['[']=']',['{']='}',['<']='>'}
for k, v in pairs(surround) do
  map('v', '<leader>s' .. k, 'xi' .. k .. v .. '<Esc><left>p<right>',
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

map("n", '<leader>zi', ":tabedit %<CR>", {desc = 'tab out pane'})
map("n", '<leader>zo', ":tabclose<CR>", {desc = 'tab close'})
