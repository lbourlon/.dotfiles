-- [[ Configure Telescope ]]
-- 
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

    -- nmap('<leader>sc', tele_builtin.search_history, '[S]earch [C]ommand history')
    nmap('<leader>sc', tele_builtin.command_history, '[S]earch [C]ommand history')
    -- nmap('<leader>tch', tele_builtin.commands, '[T]elescope [C]ommand [L]ist')

    nmap('<leader>sr', tele_builtin.resume, '[S]earch [R]esume')
    nmap('<leader>sk', tele_builtin.keymaps, '[S]earch [K]eymaps')

    local tele_themes = require('telescope.themes')

    nmap('<leader>sd', function ()
      tele_builtin.diagnostics(tele_themes.get_ivy()) end, '[S]earch [D]iagnostics')

    nmap('<leader>sm', function ()
      tele_builtin.marks(tele_themes.get_ivy()) end, '[S]earch [M]arks')

    nmap('<leader>sj', function ()
      tele_builtin.jumplist(tele_themes.get_ivy()) end, '[S]earch [J]umplist')

    nmap('<leader>ss', function ()
      tele_builtin.spell_suggest(tele_themes.get_cursor()) end, '[S]earch [S]pelling')

    nmap('<leader>sq', function()
      tele_builtin.quickfix(tele_themes.get_ivy()) end, '[S]earch [Q]uickfix')

    nmap('<leader>:', function()
      tele_builtin.current_buffer_fuzzy_find(tele_themes.get_dropdown {
        winblend = 10, previewer = false, })
    end, '[/] Fuzzily search in current buffer')

  end
}
