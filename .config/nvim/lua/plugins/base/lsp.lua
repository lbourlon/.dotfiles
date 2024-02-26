return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim', tag = "v1.1.0", opts = {} },
    { 'folke/neodev.nvim', opts = {}},
  },

  config = function()
    Border = { {"🭽", "FloatBorder"}, {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"}, {"▕", "FloatBorder"}, {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"}, {"🭼", "FloatBorder"}, {"▏", "FloatBorder"}}

    -- LSP settings (for overriding per client)
    local handlers =  {
      ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = Border}),
      ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = Border }),
    }

    vim.diagnostic.config({ virtual_text = false, signs = true,
      underline = true, update_in_insert = false, severity_sort = true, })

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    -- STYLE

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
      nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
      nmap('gI', vim.lsp.buf.implementation, '[g]oto [I]mplementation')
      nmap('K',  vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]ename')
      nmap('<leader>sk', vim.lsp.buf.signature_help, '[S]ignature Documentation')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('<leader>cs',  ":ClangdSwitchSourceHeader<CR>", '[C]langd [S]witch')

      local telescopeconfig = require('telescope.builtin');
      nmap('gs', telescopeconfig.lsp_document_symbols, '[g]oto [S]ymbols current buf')
      nmap('gt', telescopeconfig.lsp_type_definitions, '[g]oto [T]ypes definition')

      -- nmap('<leader>vrr', vim.lsp.buf.clear_references, '[C]lear [R]eferences')
      nmap('<leader>cr', telescopeconfig.lsp_references, '[C]ode [R]eferences')


      -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      -- Hints under cursor
      -- vim.api.nvim_create_autocmd("CursorHold", {
      --   buffer = bufnr,
      --   callback = function()
      --     local opts = {
      --       focusable = false,
      --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      --       border = Border, source = 'always', prefix = ' ', scope = 'cursor',
      --     }
      --     vim.diagnostic.open_float(nil, opts)
      --   end
      -- })

   end -- END on_attach



    -- SERVERS
    local servers = {
      clangd = {
        filetypes = { "c" },
        cmd = {
          "clangd",
          "--header-insertion-decorators",
          "--completion-style=detailed",
          --'--tweaks="-ferror-limit=0"',
        },
        root_patterns = {"compile-commands.json", ".clang", ".clang-format"},
      },
      -- asm_lsp = { cmd = { "asm-lsp" }, filetypes = { "asm", "vmasm" } }, 
      pylsp = {
        pylsp = {
          plugins = { pycodestyle = { enabled = false, }, jedi_completition = { enabled = true },
          },
        },
      },
      -- lua_ls = { Lua = {
      --   workspace = { checkThirdParty = false },
      --   telemetry = { enable = false },
      -- }}
    }

    -- if os.getenv("WORK_ENV") == "no" then
    --   servers.zls = { zls = {}};
    -- end

    local cap = vim.lsp.protocol.make_client_capabilities()
    cap = require('cmp_nvim_lsp').default_capabilities(cap)

    local masn = require('mason-lspconfig')
    -- masn.setup({ ensure_installed = vim.tbl_keys(servers) })
    -- MasonInstall python-lsp-server@1.3.3

    masn.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup {
          settings = servers[server_name],
          capabilities = cap,
          handlers = handlers,
          on_attach = on_attach,
          filetypes = (servers[server_name] or {}).filetypes,
          root_patterns = (servers[server_name] or {}).root_patterns,
          cmd = (servers[server_name] or {}).cmd,
        }
      end,
    })

  end
}
