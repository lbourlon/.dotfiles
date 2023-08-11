-- [[ Configure Telescope ]]

return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function ()
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-d>'] = require('telescope.actions').cycle_history_next,
            ['<C-u>'] = require('telescope.actions').cycle_history_prev,
          },
        },
      }
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    -- Enable Harpoon telescope integration
    require('telescope').load_extension('harpoon')

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, {desc = 'TELE: ' .. desc })
    end

    local tele_builtin = require('telescope.builtin')

    -- See `:help telescope.builtin`
    -- vim.keymap.set('n', '<leader>?', tele_builtin.oldfiles, )
    nmap('<leader>?', tele_builtin.oldfiles, '[?] Find recently opened files')
    nmap('<leader><space>', tele_builtin.buffers,'[ ] Find existing buffers')

    nmap('<leader>sf', tele_builtin.find_files, '[S]earch [F]iles')
    nmap('<leader>sh', tele_builtin.help_tags, '[S]earch [H]elp')
    nmap('<leader>sw', tele_builtin.grep_string, '[S]earch current [W]ord')
    nmap('<leader>sg', tele_builtin.live_grep, '[S]earch by [G]rep')
    -- nmap('<leader>sg', tele_builtin.git_files, '[S]earch [G]it')
    nmap('<leader>sd', tele_builtin.diagnostics, '[S]earch [D]iagnostics')

    nmap('<leader>tc', tele_builtin.commands, '[T]elescope [C]ommands')
    nmap('<leader>tm1', ":Telescope man_pages sections=1,1<CR>", '[T]elescope [M]an 1')
    nmap('<leader>tm2', ":Telescope man_pages sections=2,2<CR>", '[T]elescope [M]an 2')
    nmap('<leader>tm3', ":Telescope man_pages sections=3,3<CR>", '[T]elescope [M]an 3')

    nmap('<leader>tr', tele_builtin.marks, '[T]elescope [r] marks')
    nmap('<leader>tj', tele_builtin.jumplist, '[T]elescope [J]umplist')

    nmap('<leader>tk', tele_builtin.keymaps, '[T]elescope [K]eymaps')
    nmap('<leader>th', tele_builtin.help_tags, '[T]elescope [H]elp')
    -- nmap('<leader>tf', tele_builtin.quickfix, '[T]elescope [F]ix')
    nmap('<leader>tp', tele_builtin.planets, '[T]elescope [P]lanets')


    -- You can pass additional configuration to telescope to change theme, layout, etc.
    nmap('<leader>:', function()
      tele_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, '[/] Fuzzily search in current buffer')

  end
}
