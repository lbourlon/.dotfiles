return {
  'akinsho/bufferline.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},

  config = function()
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", {desc="Cycle to Next bufferline"})
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", {desc="Cycle to Prev bufferline"})
    -- vim.keymap.set("n", "<leader>m", ":BufferLinePick<CR>", {desc="Buffer [C]hose"})

    require("bufferline").setup {
      options = {
      numbers = "ordinal",
        indicator = {style ="underline"},
        separator_style = "slant",
      },
    }

  end,
}


