-- [[ Configure Telescope ]]

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-ui-select.nvim'},
    { "nvim-telescope/telescope-live-grep-args.nvim" , version = "^1.0.0", }, -- no breaking changes
  },

  config = function ()
    local require_tele = require('telescope')
    local tele_builtin = require('telescope.builtin')
    local tele_ext = require('telescope').extensions
    local tele_themes = require('telescope.themes')
    local center_dropdown = tele_themes.get_dropdown { previewer = false, }
    local bottom_pane = tele_themes.get_ivy { }
    local lga_actions = require("telescope-live-grep-args.actions")
    local actions = require('telescope.actions')
    require_tele.setup {
      extensions = {
        ["ui-select"] = { center_dropdown, },
        ["live_grep_args"] = {
          auto_quoting = false,
          mappings = { -- extend mappings
            i = {
              ["<C-o>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        }
      },
    defaults = {
        file_ignore_patterns = {
          "^.cache/", "build", "dist", "yarn.lock"
        },
      mappings = {
        i = {
          ["<C-space>"] = require('telescope.actions').to_fuzzy_refine,
        },
      },
        -- pickers = {
        --   find_files= {
        --     hidden = true,
        --     -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        --     find_command = { "rg", "--no-ignore", "--hidden", "--files prompt_prefix=o",},
        --   },
        -- },
    },
  }

    -- Enable telescope fzf native, if installed
    pcall(require_tele.load_extension, 'fzf')
    pcall(require_tele.load_extension, 'ui-select')

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, {desc = 'TELE: ' .. desc })
    end


    nmap('<leader>?', tele_builtin.oldfiles, '[?] Find recently opened files')
    nmap('<leader>sb', tele_builtin.buffers,'[S]earch [B]uffers')

    nmap('<leader>sf', tele_builtin.find_files, '[S]earch [F]iles')
    -- nmap('<leader>sf', ":Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍<CR>", '[S]earch [F]iles')
    nmap('<leader>sh', tele_builtin.help_tags, '[S]earch [H]elp')
    nmap('<leader>su', tele_builtin.grep_string, '[S]earch [U]nder')
    -- nmap('<leader>sg', tele_builtin.live_grep, '[S]earch by [G]rep')
    nmap('<leader>sg', tele_ext.live_grep_args.live_grep_args, '[S]earch by [G]rep')
    -- nmap('<leader>scr', tele_builtin.git_files, '[S]earch [C]ode [R]epo')
    nmap('<leader>sch', tele_builtin.command_history, '[S]earch [C]ommand [H]istory')
    -- nmap('<leader>tch', tele_builtin.commands, '[T]elescope [C]ommand [L]ist')
    nmap('<leader>sr', tele_builtin.resume, '[S]earch [R]esume')
    nmap('<leader>tch', tele_builtin.vim_options, '[T]elescope [O]ptions')
    nmap('<leader>sk', tele_builtin.keymaps, '[S]earch [K]eymaps')

    nmap('<leader>gb', tele_builtin.git_branches, '[G]it [B]ranches')
    nmap('<leader>gl', tele_builtin.git_bcommits, '[G]it [L]og (commits)')
    nmap('<leader>gs', tele_builtin.git_bcommits, '[G]it [S]tatus')
    nmap('<leader>gf', tele_builtin.git_files, '[G]it [F]iles')

    nmap('<leader>sd', function () tele_builtin.diagnostics(bottom_pane) end, '[S]earch [D]iagnostics')
    nmap('<leader>sm', function () tele_builtin.marks(bottom_pane) end, '[S]earch [M]arks')
    nmap('<leader>sj', function () tele_builtin.jumplist(bottom_pane) end, '[S]earch [J]umplist')
    nmap('<leader>sq', function() tele_builtin.quickfix(bottom_pane) end, '[S]earch [Q]uickfix')
    nmap('<leader>ss', function () tele_builtin.spell_suggest(center_dropdown) end, '[S]earch [S]pelling')
    nmap('<leader>:', function() tele_builtin.current_buffer_fuzzy_find(center_dropdown) end, '[/] Fuzzily search in current buffer')

  end
}
