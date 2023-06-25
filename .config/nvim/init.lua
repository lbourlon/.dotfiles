vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup('plugins', {
  change_detection = { enabled = true, notify = false },
  checker = {
    enabled = true,
    notify = false,
    frequency = 3600
  },
})


require('custom.keymaps')
require('custom.options')
require('custom.panes')
require('custom.aucmds')
