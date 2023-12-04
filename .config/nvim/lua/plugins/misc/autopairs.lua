return {
  "windwp/nvim-autopairs",
  comit="0f04d78",
  dependencies = {{'hrsh7th/nvim-cmp',
                   commit="0b751f6beef40fd47375eaf53d3057e0bfa317e4"
                 }},

  config = function()
    require("nvim-autopairs").setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
