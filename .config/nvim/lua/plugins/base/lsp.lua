return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim', tag = "v1.1.0" },
    {'folke/neodev.nvim', opts = {}},
    {'hrsh7th/cmp-nvim-lsp'},
  },

  config = function()
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
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]code [A]ction')

      local telescopeconfig = require('telescope.builtin');
      nmap('gs', telescopeconfig.lsp_document_symbols, '[g]oto [S]ymbols current buf')
      nmap('gt', telescopeconfig.lsp_type_definitions, '[g]oto [T]ypes definition')

      -- nmap('<leader>vrr', vim.lsp.buf.clear_references, '[C]lear [R]eferences')
      nmap('<leader>cr', telescopeconfig.lsp_references, '[C]ode [R]eferences')

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    local servers = {
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        cmd = {"clangd", }
      },
      -- asm_lsp = { cmd = { "asm-lsp" }, filetypes = { "asm", "vmasm" } },
      -- pylsp = { pylsp = { plugins = { pycodestyle = { enabled = false, },
      -- jedi_completition = { enabled = true }, }, }, },
      lua_ls = { Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      }}
    }

    local cap = vim.lsp.protocol.make_client_capabilities()
    cap = require('cmp_nvim_lsp').default_capabilities(cap)

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers)})
    mason_lspconfig.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = cap,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    })
  end
}
