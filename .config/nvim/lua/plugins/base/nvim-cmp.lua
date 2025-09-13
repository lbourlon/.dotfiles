return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
  },

  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp = require 'cmp'
    local lsnip = require 'luasnip'
    local map = require 'cmp'.mapping

    lsnip.config.setup({})

    local mapings = cmp.mapping.preset.insert {
      ['<C-u>']     = map.scroll_docs(-4),
      ['<C-d>']     = map.scroll_docs(4),
      ['<C-n>']     = map.select_next_item(),
      ['<C-p>']     = map.select_prev_item(),
      ['<C-y>']     = map.confirm { select = true },
      -- ['<C-i>']     = map.complete(),

      ['<C-l>'] = map(function()
          if lsnip.expand_or_locally_jumpable() then lsnip.expand_or_jump() end
      end, { 'i', 's' }),

      ['<C-h>'] = map(function()
        if lsnip.locally_jumpable(-1) then lsnip.jump(-1) end
      end, { 'i', 's' }),
    }

    local my_icons = {
      Text = ' ',
      Method = '󰆧 ',
      Function = '󰊕',
      Constructor = ' ',
      Field = '󰇽 ',
      Variable = '󰂡',
      Class = '󰠱 ',
      Interface = ' ',
      Module = ' ',
      Property = '󰜢 ',
      Unit = ' ',
      Value = '󰎠 ',
      Enum = ' ',
      Keyword = '󰌋 ',
      Snippet = ' ',
      Color = '󰏘 ',
      File = '󰈙',
      Reference = ' ',
      Folder = '󰉋 ',
      EnumMember = ' ',
      Constant = '󰏿',
      Struct = ' ',
      Event = '',
      Operator = ' ',
      TypeParameter = ' ',
    }

    cmp.setup({
      snippet = { expand = function(args)
        lsnip.lsp_expand(args.body)
      end },
      completion = { completeopt = 'menu,menuone,noinsert' },
      window = {
        completion = cmp.config.window.bordered {col_offset =-1},
        documentation = cmp.config.window.bordered {}
      },
      experimental = {ghost_text = true},
      formatting = {
        expandable_indicator = false,
        fields = { 'abbr', 'kind', 'menu'},
        format = function(entry, item)
          item.kind = string.format('    %s  %s', my_icons[item.kind], item.kind)
          item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
          })[entry.source.name]
          return item
        end
      },

      mapping = mapings,
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    })
  end
}
