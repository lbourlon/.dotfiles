return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim',          opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'folke/lazydev.nvim',               opts = {} },
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
        nmap('gih', function()
          vim.lsp.inlay_hint.enable(not
            vim.lsp.inlay_hint.is_enabled())
        end, '[I]nlay [H]ints')

        vim.keymap.set('n', 'gK', function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })

        -- same as ]d and [d, french keyboard alt-gr shenanians
        nmap(']ð', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'goto next diagnostic')
        nmap('[ð', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'goto previous diagnostic')

        nmap('<leader>rn', function() print("Replaced by 'grn'") end, '[R]ename')
        nmap('<leader>ca', function() print("Replaced by 'gra'") end, 'Code Action')
        nmap('<leader>cr', function() print("Replaced by 'grr'") end, 'Code References')
        nmap('<leader>ct', function() print("Replaced by 'grt'") end, 'Code Types')
        nmap('grt', vim.lsp.buf.type_definition, '[C]ode [T]ypes') -- override (default in v0.12)
        nmap('g0', vim.lsp.buf.document_symbol, 'document_symbol') -- override (default in v0.12)
        nmap('grr', require('telescope.builtin').lsp_references, 'vim.lsp.buf.references')      -- override

        nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
        nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
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
          jedi_completition = { enabled = true },
        },
      },
    })
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
      cmd = {
        "clangd", "--header-insertion-decorators",
        "--completion-style=detailed",
        "--clang-tidy",
        --'--tweaks="-ferror-limit=0"',
      },
      settings = {
        root_patterns = { "compile-commands.json", ".clang", ".clang-format", ".clang-tidy" },
      }
    })
    vim.lsp.enable('clangd')

    local mc_capa = vim.lsp.protocol.make_client_capabilities()
    mc_capa.textDocument.declaration.dynamicRegistration = true
    mc_capa.textDocument.implementation.dynamicRegistration = true
    mc_capa.textDocument.typeDefinition.dynamicRegistration = true
    mc_capa.textDocument.documentHighlight.dynamicRegistration = true
    mc_capa.textDocument.hover.dynamicRegistration = true
    mc_capa.textDocument.signatureHelp.contextSupport = true
    mc_capa.textDocument.signatureHelp.dynamicRegistration = true
    mc_capa.textDocument.foldingRange.lineFoldingOnly = true
    mc_capa.textDocument.foldingRange.dynamicRegistration = true
    mc_capa.workspace = { didChangeWorkspaceFolders = { dynamicRegistration = true, }, }

    local root = require("lspconfig").util.root_pattern("monkey.jungle", "manifest.xml")
    local rootPath = root(vim.fn.getcwd()) or vim.fn.getcwd()
    vim.lsp.config('monkeyc_ls', {
      filetypes = { "mc", "monkeyc", "java" },
      cmd = {
        "/usr/bin/java",
        "-Dapple.awt.UIElement=true",
        "-classpath",
        "/home/lbourlon/.Garmin/ConnectIQ/Sdks/connectiq-sdk-lin-8.4.0-2025-12-03-5122605dc/bin/LanguageServer.jar",
        "com.garmin.monkeybrains.languageserver.LSLauncher"
      },
      root_patterns = { "monkey.jungle", "manifest.xml", ".gitignore" },
      capabilities = mc_capa,
      init_options = {
        publishWarnings = vim.g.monkeyc_publish_warnings or true,
        compilerOptions = vim.g.monkeyc_compiler_options or "",
        typeCheckMsgDisplayed = false,
        workspaceSettings = { {
            path = rootPath,
            jungleFiles = {
              rootPath .. "/monkey.jungle",
            },
          },
        },
      },
      settings =
      {
        developerKeyPath = "/home/lbourlon/.secret/garmin_dev_key",
        compilerWarnings = true,
        compilerOptions = vim.g.monkeyc_compiler_options or "",
        developerId = "",
        javaPath = "",
        typeCheckLevel = "Default",
        optimizationLevel = "Default",
        testDevices = { "fenix7", },
        debugLogLevel = "Default",
      }
    })
    vim.lsp.enable('monkeyc_ls')

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
