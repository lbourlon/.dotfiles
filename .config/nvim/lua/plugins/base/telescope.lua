-- [[ Configure Telescope ]]

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-ui-select.nvim'}
  },

  config = function ()
    local require_tele = require('telescope')
    local tele_builtin = require('telescope.builtin')
    local tele_themes = require('telescope.themes')
    local center_dropdown = tele_themes.get_dropdown { previewer = false, }
    local bottom_pane = tele_themes.get_ivy { }

    require_tele.setup {
      extensions = { ["ui-select"] = { center_dropdown, }, },
      defaults = {
        mappings = {
          i = {
            ['<C-d>'] = require('telescope.actions').cycle_history_next,
            ['<C-u>'] = require('telescope.actions').cycle_history_prev,
          },
        },
      }
    }

    require_tele.load_extension("ui-select")

    -- Enable telescope fzf native, if installed
    pcall(require_tele.load_extension, 'fzf')
    pcall(require_tele.load_extension, 'ui-select')

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, {desc = 'TELE: ' .. desc })
    end


    nmap('<leader>?', tele_builtin.oldfiles, '[?] Find recently opened files')
    nmap('<leader><space>', tele_builtin.buffers,'[ ] Find existing buffers')

    nmap('<leader>sf', tele_builtin.find_files, '[S]earch [F]iles')
    nmap('<leader>sh', tele_builtin.help_tags, '[S]earch [H]elp')
    nmap('<leader>su', tele_builtin.grep_string, '[S]earch [U]nder')
    nmap('<leader>sg', tele_builtin.live_grep, '[S]earch by [G]rep')
    -- nmap('<leader>scr', tele_builtin.git_files, '[S]earch [C]ode [R]epo')
    nmap('<leader>sch', tele_builtin.command_history, '[S]earch [C]ommand [H]istory')
    -- nmap('<leader>tch', tele_builtin.commands, '[T]elescope [C]ommand [L]ist')
    nmap('<leader>sl', tele_builtin.resume, '[S]earch [L]ast')
    nmap('<leader>sk', tele_builtin.keymaps, '[S]earch [K]eymaps')


    nmap('<leader>sd', function () tele_builtin.diagnostics(bottom_pane) end, '[S]earch [D]iagnostics')
    nmap('<leader>sm', function () tele_builtin.marks(bottom_pane) end, '[S]earch [M]arks')
    nmap('<leader>sj', function () tele_builtin.jumplist(bottom_pane) end, '[S]earch [J]umplist')
    nmap('<leader>sq', function() tele_builtin.quickfix(bottom_pane) end, '[S]earch [Q]uickfix')
    nmap('<leader>ss', function () tele_builtin.spell_suggest(center_dropdown) end, '[S]earch [S]pelling')
    nmap('<leader>:', function() tele_builtin.current_buffer_fuzzy_find(center_dropdown) end, '[/] Fuzzily search in current buffer')

  end
}
