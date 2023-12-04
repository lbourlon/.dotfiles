return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  commit="694aaec",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {'williamboman/mason.nvim', commit="41e75af"},
    {'williamboman/mason-lspconfig.nvim', commit="4eb8e15"},

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = "legacy", opts = { text = { spinner = "moon" } } },

    -- Additional lua configuration,
    {'folke/neodev.nvim', config="1676d2c"},
  },


  config = function()
    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end


      local tlscp = require('telescope.builtin');
      nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
      nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
      nmap('gI', vim.lsp.buf.implementation, '[g]oto [I]mplementation')
      nmap('gs', tlscp.lsp_document_symbols, '[g]oto [S]ymbols current buf')
      nmap('gt', tlscp.lsp_type_definitions, '[g]oto [T]ypes definition')

      -- `:help K`, got used to it and I like it
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

      -- lesser used
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]ename')
      nmap('<leader>sk', vim.lsp.buf.signature_help, '[S]ignature Documentation') -- changed from C-k
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]code [A]ction')
      -- nmap('<leader>vrr', vim.lsp.buf.clear_references, '[C]lear [R]eferences')
      nmap('<leader>cr', tlscp.lsp_references, '[C]ode [R]eferences')

      -- Workspace things functionality
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')
      nmap('<leader>ws', tlscp.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      nmap('<leader>=', vim.lsp.buf.format, 'Format Whole file')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end


    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    local servers = {
      clangd = {
        -- filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        filetypes = { "c"},
      },
      -- rust_analyzer = {},
      --https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
      --https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
      --	https://github.com/bergercookie/asm-lsp
      -- asm_lsp = {
      --   cmd = { "asm-lsp" },
      --   filetypes = { "asm", "vmasm" }
      -- },

      -- pylsp = {
      --   pylsp = {
      --     plugins = {
      --       pycodestyle = { enabled = false, },
      --       jedi_completition = { enabled = true },
      --   },
      --   },
      -- },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }


    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Setup mason so it can manage external tooling
    require('mason').setup()

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end
}
