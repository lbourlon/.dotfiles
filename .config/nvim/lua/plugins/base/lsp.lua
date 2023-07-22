return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, 
    'folke/neodev.nvim',
  },


  config = function ()

    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('rn', vim.lsp.buf.rename, '[R]ename')
      nmap('ca', vim.lsp.buf.code_action, '[C]code [A]ctions')

      nmap('cr', vim.lsp.buf.clear_references, '[C]lear [R]eferences')


      nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
      nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
      nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[g]oto [I]mplementation')
      nmap('gs', require('telescope.builtin').lsp_document_symbols, '[g]oto [S]ymbols current buf')
      nmap('gt', require('telescope.builtin').lsp_type_definitions, '[g]oto [T]ypes definition')


      -- `:help K`, got used to it and I like it
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>lk', vim.lsp.buf.signature_help, 'Signature Documentation') -- changed from C-k

      -- Workspace things functionality
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    local servers = {
      clangd = {},
      rust_analyzer = {},

      --https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md

      pylsp = {
        pylsp = {
        plugins = {
            pycodestyle = { enabled = false,},
            jedi_completition = { enabled = true },
          },
        },
      },
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
