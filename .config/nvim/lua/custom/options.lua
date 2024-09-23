-- VIM OPTIONS
-- Get panes to go on the direction I expect

-- Because these suck
vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Wrap options
vim.opt.wrap = true
vim.opt.breakindent = true -- Enable break indent

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- for indent auto >>
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.cindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Keep Capital if in query

vim.opt.virtualedit = "block"

-- Cursor
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20," .. "i:blinkon20,i:blinkoff100"
vim.opt.mouse = '' -- Disable mouse mode
vim.opt.termguicolors = true

-- Decrease update time
vim.opt.updatetime = 5
vim.opt.timeout = true
vim.opt.timeoutlen = 300

--  Misc
vim.opt.undofile = true -- Save undo history
vim.opt.signcolumn = 'yes' -- git, debug, column, and others
vim.opt.completeopt = 'menu,noselect,noinsert'
vim.opt.colorcolumn= "80"
vim.opt.cmdheight = 1
vim.opt.list = true
vim.opt.listchars="trail:•,tab:▶ ,extends:⟩,precedes:⟨" -- leadmultispace:┊   ,
