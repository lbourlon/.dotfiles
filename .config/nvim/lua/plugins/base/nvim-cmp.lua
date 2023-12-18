return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    --{'hrsh7th/cmp-buffer'},
    --{'hrsh7th/cmp-path'},
    --{'hrsh7th/cmp-cmdline'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
  },

  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()

    -- nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.config.setup {}

    cmp.setup({
      -- snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        -- USE C-n and C-p to choose
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    })
  end,
}
