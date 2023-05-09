return {
  'akinsho/toggleterm.nvim',

  -- soon to be removed by personal implementation
  config = function()
    vim.keymap.set("n", "<leader>tl", ":ToggleTerm direction=vertical size=60<CR>",   {desc = "terminal on the right"})
    vim.keymap.set("n", "<leader>tj", ":ToggleTerm direction=horizontal<CR>", {desc = "terminal on the bottom"})


    require("toggleterm").setup {
      open_mapping = "<C-n>",
      --on_create = fun(t: Terminal),
      persist_mode = false,
      direction = "vertical",
      --border = "single",
    }

  end,
}
