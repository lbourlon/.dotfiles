return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim',          opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/lazydev.nvim',                opts = {} },
  },

  config = function()
    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰌶 ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    })

    -- temporary workaround until a fix for plenary to avoid double borders of vim.o.winborder = 'rounded'
    local hover = vim.lsp.buf.hover
    vim.lsp.buf.hover = function()
      return hover({
        border = "rounded",
        max_width = math.floor(vim.o.columns * 0.7),
        max_height = math.floor(vim.o.lines * 0.7),
      })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local nmap = function(keys, func, desc)
          if desc then desc = 'LSP: ' .. desc end
          vim.keymap.set('n', keys, func, { desc = desc })
        end
        -- local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- if client:supports_method('textDocument/hover') then
        --   ["textDocument/hover"] =  round_handler(vim.lsp.handlers.hover),
        -- end
        -- if client:supports_method('textDocument/completion') then
        --   vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        -- end

        vim.lsp.inlay_hint.enable(false)
        nmap('gih', function() vim.lsp.inlay_hint.enable(not
          vim.lsp.inlay_hint.is_enabled()) end, '[I]nlay [H]ints')

        vim.keymap.set('n', 'gK', function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })

        -- same as ]d and [d, french keyboard alt-gr shenanians
        nmap(']ð', function() vim.diagnostic.jump({count=1, float=true}) end, 'goto next diagnostic')
        nmap('[ð', function() vim.diagnostic.jump({count=-1, float=true}) end, 'goto previous diagnostic')

        nmap('<leader>rn', function() print("Replaced by 'grn'") end, '[R]ename')
        nmap('<leader>ca', function() print("Replaced by 'gca'") end, 'Code Action')
        nmap('<leader>cr', function() print("Replaced by 'grr'") end, 'Code References')
        nmap('<leader>cr', require('telescope.builtin').lsp_references) -- override
        nmap('grr', require('telescope.builtin').lsp_references)        -- override

        nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
        nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
        nmap('<leader>ct', require('telescope.builtin').lsp_references, '[C]ode [T]ype')
        vim.api.nvim_buf_create_user_command(args.buf, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        nmap('<leader>cs', ":LspClangdSwitchSourceHeader<CR>", '[C]langd [S]witch')
        nmap('<leader>ci', ":LspClangdShowSymbolInfo<CR>", '[C]langd [I]nfo')
      end
    })

    -- if os.getenv("WORK_ENV") == "no" then
    --   servers.zls = { zls = {}};
    --   servers.asm_lsp = { cmd = { "asm-lsp" }, filetypes = { "asm", "vmasm" } },
    -- end

    -- reminder
    -- MasonInstall python-lsp-server@1.3.3

    -- SERVERS
    vim.lsp.config('pylsp', {
        settings = {
          plugins = {
            pycodestyle = { enabled = false, },
            jedi_completition = { enabled = true }, },},})
    vim.lsp.enable('pylsp')
    -- TODO : add ruff and pylint

    vim.lsp.config('lua_ls', {
      settings = {
        -- completition = { callSnipet = "Replace" },
        runtime = { version = 'LuaJIT' },
        telemetry = { enable = false },
      }
    })
    vim.lsp.enable('lua_ls')

    vim.lsp.config('clangd', {
      filetypes = { "c", "cpp", "cuda" },
      settings = {
        cmd = {
          "clangd", "--header-insertion-decorators",
          "--completion-style=detailed",
          "--clang-tidy",
          --'--tweaks="-ferror-limit=0"',
        },
        root_patterns = { "compile-commands.json", ".clang", ".clang-format", ".clang-tidy" },
      }
    })
    vim.lsp.enable('clangd')

    -- Add nvim-cmp completion capabilities to lsp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    vim.lsp.config('*', { capabilities = capabilities, });

    vim.lsp.config('*', {
      capabilities = {
        textDocument = {
          semanticTokens = {
            multilineTokenSupport = true,
          }
        }
      },
    })
  end
}
