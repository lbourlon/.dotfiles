-- [[ Configure Telescope ]]
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {{'nvim-lua/plenary.nvim'}},

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
    nmap('<leader>sr', tele_builtin.git_files, '[S]earch [R]epo Files')

    nmap('<leader>ths', tele_builtin.search_history, '[T]elescope [C]ommand [H]istory')
    nmap('<leader>thc', tele_builtin.command_history, '[T]elescope [C]ommand [H]istory')
    nmap('<leader>tch', tele_builtin.commands, '[T]elescope [C]ommand [L]ist')
    -- nmap('<leader>tm1', ":Telescope man_pages sections=1,1<CR>", '[T]elescope [M]an 1')
    -- nmap('<leader>tm2', ":Telescope man_pages sections=2,2<CR>", '[T]elescope [M]an 2')
    -- nmap('<leader>tm3', ":Telescope man_pages sections=3,3<CR>", '[T]elescope [M]an 3')
    -- nmap('<leader>tm7', ":Telescope man_pages sections=7,7<CR>", '[T]elescope [M]an 7')

    nmap('<leader>tr', tele_builtin.resume, '[T]elescope [R]esume')

    nmap('<leader>tk', tele_builtin.keymaps, '[T]elescope [K]eymaps')
    nmap('<leader>th', tele_builtin.help_tags, '[T]elescope [H]elp')

    local tthemes = require('telescope.themes')

    nmap('<leader>td', function ()
      tele_builtin.diagnostics(tthemes.get_ivy()) end, '[T]elescope [D]iagnostics')

    nmap('<leader>tm', function ()
      tele_builtin.marks(tthemes.get_ivy()) end, '[T]elescope [M]arks')

    nmap('<leader>tj', function ()
      tele_builtin.jumplist(tthemes.get_ivy()) end, '[T]elescope [J]umplist')

    nmap('<leader>ts', function ()
      tele_builtin.spell_suggest(tthemes.get_cursor()) end, '[T]elescope [S]pelling')

    nmap('<leader>tq', function()
      tele_builtin.quickfix(tthemes.get_ivy()) end, '[T]elescope [Q]uickfix')

    nmap('<leader>:', function()
      tele_builtin.current_buffer_fuzzy_find(tthemes.get_dropdown {
        winblend = 10, previewer = false, })
    end, '[/] Fuzzily search in current buffer')

  end
}
