return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  commit="0b751f6beef40fd47375eaf53d3057e0bfa317e4",
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp',commit="44b16d1"},
    {'L3MON4D3/LuaSnip',commit="f030898"},
    {'saadparwaiz1/cmp_luasnip',commit="05a9ab2"},
  },

  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()

    -- nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm { select = true },

        -- USE C-n and C-p to choose
        -- Tab and s-Tab to jump
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  end,
}
