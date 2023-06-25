-- VIM OPTIONS
-- vim.opt.smoothscroll = true -- I didn't know this was a thing

-- Get panes to go on the direction I expect
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 8

-- Wrap options
vim.opt.wrap = true
vim.o.breakindent = true -- Enable break indent

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- for indent auto >>
vim.opt.expandtab = false -- get actual tabs instead of spaces
--vim.opt.smartindent = true
vim.opt.autoindent = true
--vim.opt.cindent = true

-- Search
vim.o.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true -- Keep Capital if in query

-- Cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
vim.opt.guicursor = "i:blinkon20,i:blinkoff100"
vim.o.mouse = 'a' -- Enable mouse mode

vim.opt.termguicolors = true

-- Decrease update time
vim.opt.updatetime = 1000
vim.opt.timeout = true
vim.opt.timeoutlen = 300


--  Misc
vim.o.undofile = true -- Save undo history
vim.o.signcolumn = 'yes' -- git, debug, column, and others
vim.o.completeopt = 'menu,noselect'


-- [[ Highlight on yank ]]

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
