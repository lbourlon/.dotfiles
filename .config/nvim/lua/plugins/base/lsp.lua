return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim', tag = "v1.1.0", opts = {} },
    { 'folke/neodev.nvim', opts = {}},
  },

  config = function()
    vim.diagnostic.config({ virtual_text = false, signs = true,
      underline = true, update_in_insert = false, severity_sort = true, })

    -- STYLE
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

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

      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      nmap('<leader>cr', require('telescope.builtin').lsp_references, '[C]ode [R]eferences')
      nmap('<leader>cs',  ":ClangdSwitchSourceHeader<CR>", '[C]langd [S]witch')

      -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
   end -- END on_attach

    -- SERVERS
    local servers = {
      clangd = {
        filetypes = { "c" },
        cmd = {
          "clangd", "--header-insertion-decorators",
          "--completion-style=detailed",
          --'--tweaks="-ferror-limit=0"',
        },
        root_patterns = {"compile-commands.json", ".clang", ".clang-format"},
      },
      -- asm_lsp = { cmd = { "asm-lsp" }, filetypes = { "asm", "vmasm" } }, 
      pylsp = { pylsp = {
          plugins = {
            pycodestyle = { enabled = false, },
            jedi_completition = { enabled = true },
          },
        },
      },
      lua_ls = { Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- library = { '${3rd}/luv/library', unpack(vim.api.nvim_get_runtime_file('', true)), },
          library = { vim.env.VIMRUNTIME },
        },
        telemetry = { enable = false },
      }}
    }

    -- if os.getenv("WORK_ENV") == "no" then
    --   servers.zls = { zls = {}};
    -- end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local masn = require('mason-lspconfig')
    -- masn.setup({ ensure_installed = vim.tbl_keys(servers) })
    -- MasonInstall python-lsp-server@1.3.3

    masn.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup {
          settings = servers[server_name],
          capabilities = capabilities,
          -- handlers = handlers,
          on_attach = on_attach,
          filetypes = (servers[server_name] or {}).filetypes,
          root_patterns = (servers[server_name] or {}).root_patterns,
          cmd = (servers[server_name] or {}).cmd,
        }
      end,
    })

  end
}
