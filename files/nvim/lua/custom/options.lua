-- VIM OPTIONS
-- Get panes to go on the direction I expect
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 8

-- Wrap options
vim.opt.wrap = false
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
vim.o.hlsearch = true
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
vim.opt.guicursor = "i:blinkon20,i:blinkoff100"
vim.o.mouse = 'a' -- Enable mouse mode

vim.opt.termguicolors = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- -- Autosave things :)
vim.api.nvim_create_autocmd({"FocusLost"},{command = "silent! wa"})
local event_list = {"BufLeave", "BufWinLeave","WinLeave"}
vim.api.nvim_create_autocmd(event_list,{command = "silent! w!"})

--  Misc
vim.o.undofile = true -- Save undo history
vim.wo.signcolumn = 'yes' -- git, debug, column, and others

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,noselect'

